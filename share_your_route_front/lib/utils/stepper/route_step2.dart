import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/services/location_service.dart';
import 'package:share_your_route_front/utils/widgets/create_route_widgets.dart';

class RouteStep2 extends StatefulWidget {
  final LatLng? meetingPoint;
  final Function(LatLng?) onMeetingPointChanged;

  const RouteStep2({
    super.key,
    required this.meetingPoint,
    required this.onMeetingPointChanged,
  });

  @override
  State<RouteStep2> createState() => _RouteStep2State();
}

class _RouteStep2State extends State<RouteStep2> {
  LatLng? myPosition;
  LatLng? selectedPosition;

  Future<void> getCurrentLocation() async {
    LatLng position = await LocationService.determinePosition();
    setState(() {
      myPosition = position;
      selectedPosition = myPosition;
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (myPosition == null)
          const CircularProgressIndicator()
        else
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: myPosition!,
                minZoom: 5,
                maxZoom: 25,
                zoom: 18,
                onTap: (tapPosition, point) {
                  setState(() {
                    selectedPosition = point;
                  });
                },
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken': 'your_mapbox_access_token',
                    'id': 'mapbox/streets-v12',
                  },
                ),
                if (selectedPosition != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 80.0,
                        height: 80.0,
                        point: selectedPosition!,
                        builder: (ctx) => const Icon(
                          Icons.location_pin,
                          size: 40,
                          color: Color.fromARGB(255, 230, 31, 17),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        const SizedBox(height: 15),
        if (selectedPosition != null)
          Text(
            'Punto de Encuentro: ${selectedPosition!.latitude}, ${selectedPosition!.longitude}',
            style: labelTextStyle,
          ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            if (selectedPosition != null) {
              widget.onMeetingPointChanged(selectedPosition);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Punto de encuentro seleccionado')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Por favor selecciona un punto de encuentro')),
              );
            }
          },
          child: const Text('Confirmar punto de encuentro'),
        ),
      ],
    );
  }
}
