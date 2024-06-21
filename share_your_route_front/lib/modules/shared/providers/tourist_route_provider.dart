import 'package:flutter/foundation.dart'; // for ValueNotifier
import 'package:share_your_route_front/models/tourist_route.dart';

class TouristRouteService {
  static final TouristRouteService _instance = TouristRouteService._internal();
  factory TouristRouteService() => _instance;

  TouristRouteService._internal();

  ValueNotifier<TouristRoute?> currentTouristRouteNotifier =
      ValueNotifier<TouristRoute?>(null);

  void setCurrentTouristRoute(TouristRoute route) {
    currentTouristRouteNotifier.value = route;
  }

  TouristRoute? getCurrentTouristRoute() {
    return currentTouristRouteNotifier.value;
  }
}
