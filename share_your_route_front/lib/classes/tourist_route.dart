import 'package:share_your_route_front/classes/place.dart';
import 'package:share_your_route_front/enums/route_type.dart';

class TouristRoute {
  final String name;
  final List<Map<Place, DateTime>> placesList;
  final currentPlaceIndex;
  final DateTime startTime;
  final DateTime endTime;
  final String image;
  final String description;
  final bool hasStarted;
  final List<RouteType> routeType;

  TouristRoute(
      {required this.name,
      required this.placesList,
      this.currentPlaceIndex = 0,
      required this.startTime,
      required this.endTime,
      required this.image,
      required this.description,
      required this.hasStarted,
      required this.routeType});
}
