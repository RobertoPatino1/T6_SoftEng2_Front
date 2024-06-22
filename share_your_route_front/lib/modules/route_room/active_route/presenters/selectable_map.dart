import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class SelectableMap extends StatefulWidget {
  final Function(LatLng) onPointSelected;

  const SelectableMap({super.key, required this.onPointSelected});

  @override
  State<SelectableMap> createState() => _SelectableMapState();
}

class _SelectableMapState extends State<SelectableMap> {
  LatLng? myPosition;
  LatLng? selectedPoint;

  Future<Position> determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Error");
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> getCurrentLocation() async {
    final Position position = await determinePosition();
    setState(() {
      myPosition = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return myPosition == null
        ? const Center(child: CircularProgressIndicator())
        : FlutterMap(
            options: MapOptions(
              center: myPosition,
              zoom: 15.0,
              onTap: (tapPosition, point) {
                setState(() {
                  selectedPoint = point;
                });
                widget.onPointSelected(point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                additionalOptions: {
                  'accessToken': dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? "",
                  'id': 'mapbox/streets-v12',
                },
              ),
              if (selectedPoint != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: selectedPoint!,
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: myPosition!,
                    builder: (ctx) => const Icon(
                      Icons.my_location,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
