import 'package:share_your_route_front/models/place.dart';
import 'package:share_your_route_front/core/constants/route_type.dart';

class TouristRoute {
  final String name;
  final List<Map<Place, DateTime>> placesList;
  final int currentPlaceIndex;
  final DateTime startTime;
  final DateTime endTime;
  final String image;
  final String description;
  final bool hasStarted;
  final List<RouteType> routeType;

  TouristRoute({
    required this.name,
    required this.placesList,
    this.currentPlaceIndex = 0,
    required this.startTime,
    required this.endTime,
    required this.image,
    required this.description,
    required this.hasStarted,
    required this.routeType,
  });

  factory TouristRoute.fromJson(Map<String, dynamic> json) {
    List<Map<Place, DateTime>> decodedPlacesList =
        (json['placesList'] as List).map((placeMap) {
      // Decodificar el mapa de Place y DateTime
      Place place = Place.fromJson(placeMap['place']);
      DateTime dateTime = DateTime.parse(placeMap['dateTime']);
      return {place: dateTime};
    }).toList();

    return TouristRoute(
      name: json['name'],
      placesList: decodedPlacesList,
      currentPlaceIndex: json['currentPlaceIndex'] ?? 0,
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      image: json['image'],
      description: json['description'],
      hasStarted: json['hasStarted'],
      routeType: (json['routeType'] as List<dynamic>)
          .map((e) => RouteType.values
              .firstWhere((element) => element.toString().split('.')[1] == e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> encodedPlacesList = placesList.map((placeMap) {
      Place place = placeMap.keys.first;
      DateTime dateTime = placeMap.values.first;
      return {
        'place': place.toJson(),
        'dateTime': dateTime.toIso8601String(),
      };
    }).toList();

    List<String> encodedRouteType =
        routeType.map((e) => e.toString().split('.')[1]).toList();

    return {
      'name': name,
      'placesList': encodedPlacesList,
      'currentPlaceIndex': currentPlaceIndex,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'image': image,
      'description': description,
      'hasStarted': hasStarted,
      'routeType': encodedRouteType,
    };
  }
}
