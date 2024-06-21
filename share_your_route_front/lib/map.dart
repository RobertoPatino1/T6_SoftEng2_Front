// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/classes/tourist_route.dart';

const MAPBOX_ACCESS_TOKEN =
    'sk.eyJ1IjoiZ2phcmV2YWwiLCJhIjoiY2x4MThna3hzMDhqZDJxcTdjaXFxc29vaSJ9.xP7hhukr96mBVQ6aakeAFg';

class MapPage extends StatelessWidget {
  final TouristRoute touristRoute;
  const MapPage({Key? key, required this.touristRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Map(touristRoute: touristRoute),
    );
  }
}

class Map extends StatefulWidget {
  final TouristRoute touristRoute;
  const Map({Key? key, required this.touristRoute}) : super(key: key);

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  LatLng? myPosition;

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      //manejar error de otra forma
      if (permission == LocationPermission.denied) {
        return Future.error("Error");
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.touristRoute.name,
          style: const TextStyle(
            color: Color.fromRGBO(37, 60, 89, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: myPosition == null
          ? CircularProgressIndicator()
          : FlutterMap(
              options: MapOptions(
                center: myPosition!,
                minZoom: 5,
                maxZoom: 25,
                zoom: 18,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': 'mapbox/streets-v12',
                  },
                ),
                MarkerLayer(markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: myPosition!,
                    builder: (BuildContext context) {
                      return const Icon(
                        Icons.location_pin,
                        size: 40,
                        color: Color.fromARGB(255, 230, 31, 17),
                      );
                    },
                  ),
                ]),
              ],
            ),
    );
  }
}
