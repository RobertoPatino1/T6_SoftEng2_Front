import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

const MAPBOX_ACCESS_TOKEN =
    'sk.eyJ1IjoiZ2phcmV2YWwiLCJhIjoiY2x4MThna3hzMDhqZDJxcTdjaXFxc29vaSJ9.xP7hhukr96mBVQ6aakeAFg';

final myPosition = LatLng(-2.180651, -79.853777);

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Map(),
    );
  }
}

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          options: MapOptions(
              initialCenter: myPosition,
              minZoom: 5,
              maxZoom: 25,
              initialZoom: 18),
          children: [
            TileLayer(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
              additionalOptions: {
                'accessToken': MAPBOX_ACCESS_TOKEN,
                'id': 'mapbox/streets-v12'
              },
            ),
            MarkerLayer(markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: myPosition,
                child: Icon(Icons.location_pin),
              )
            ])
          ]),
    );
  }
}
