import 'package:share_your_route_front/core/constants/route_type.dart';
import 'package:share_your_route_front/models/place.dart';

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
    required this.currentPlaceIndex,
    required this.startTime,
    required this.endTime,
    required this.image,
    required this.description,
    required this.hasStarted,
    required this.routeType,
  });

  factory TouristRoute.fromJson(Map<String, dynamic> json) {
    final List<Map<Place, DateTime>> decodedPlacesList =
        (json['placesList'] as List).map((placeMap) {
      // ignore: avoid_dynamic_calls
      final Place place =
          // ignore: avoid_dynamic_calls
          Place.fromJson(placeMap['place'] as Map<String, dynamic>);
      // ignore: avoid_dynamic_calls
      final DateTime dateTime = DateTime.parse(placeMap['dateTime'] as String);
      return {place: dateTime};
    }).toList();

    return TouristRoute(
      name: json['name'] as String,
      placesList: decodedPlacesList,
      currentPlaceIndex: json['currentPlaceIndex'] as int,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      image: json['image'] as String,
      description: json['description'] as String,
      hasStarted: json['hasStarted'] as bool,
      routeType: (json['routeType'] as List<dynamic>)
          .map(
            (e) => RouteType.values
                .firstWhere((element) => element.toString().split('.')[1] == e),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> encodedPlacesList =
        placesList.map((placeMap) {
      final Place place = placeMap.keys.first;
      final DateTime dateTime = placeMap.values.first;
      return {
        'place': place.toJson(),
        'dateTime': dateTime.toIso8601String(),
      };
    }).toList();

    final List<String> encodedRouteType =
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
