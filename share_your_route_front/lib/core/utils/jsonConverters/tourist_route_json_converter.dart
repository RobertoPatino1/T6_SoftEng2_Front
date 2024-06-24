import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/core/utils/jsonConverters/data_base_provitional.dart';
import 'package:share_your_route_front/models/place.dart';
import 'package:share_your_route_front/models/tourist_route.dart';

List<Place> places = [
  Place(
      name: "Lugar1",
      ubication: const LatLng(-2.144785, -79.9664887),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00)),
  Place(
      name: "Lugar2",
      ubication: const LatLng(-2.144785, -79.9664887),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00)),
  Place(
      name: "Lugar3",
      ubication: const LatLng(-2.144785, -79.9664887),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00)),
  Place(
      name: "Lugar4",
      ubication: const LatLng(-2.144785, -79.9664887),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00)),
  Place(
      name: "Lugar5",
      ubication: const LatLng(-2.144785, -79.9664887),
      startTime: const TimeOfDay(hour: 12, minute: 00),
      endTime: const TimeOfDay(hour: 14, minute: 00)),
];

//obtain data from database
List<Map<String, dynamic>> getPublicRoutes() {
  return publicRoutes;
}

List<Map<String, dynamic>> getPrivateRoutes() {
  return privateRoutes;
}

List<TouristRoute> listFromJson(List<Map<String, dynamic>> jsonList) {
  final List<TouristRoute> routesList = [];
  for (final json in jsonList) {
    routesList.add(TouristRoute.fromJson(json));
  }
  return routesList;
}

List<Map<String, dynamic>> listToJson(List<TouristRoute> routesList) {
  final List<Map<String, dynamic>> jsonList = [];
  for (final route in routesList) {
    jsonList.add(route.toJson());
  }
  return jsonList;
}
