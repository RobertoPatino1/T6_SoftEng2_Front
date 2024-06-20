// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:share_your_route_front/core/constants/route_type.dart';

class RouteTypeHelper {
  static IconData getIconData(RouteType icon) {
    switch (icon) {
      case RouteType.nature:
        return Icons.nature_people;
      case RouteType.adventure:
        return Icons.terrain;
      case RouteType.culture:
        return Icons.camera_alt;
      case RouteType.gastronomic:
        return Icons.restaurant_menu;
      case RouteType.religious:
        return Icons.church;
      case RouteType.city:
        return Icons.location_city;
    }
  }
}
