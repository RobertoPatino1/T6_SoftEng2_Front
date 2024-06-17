import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define the state notifier for managing the touristRoute
class TouristRouteNotifier extends StateNotifier<dynamic> {
  TouristRouteNotifier() : super(null);

  void setTouristRoute(dynamic route) {
    state = route;
  }

  dynamic get touristRoute => state;
}

// Define the provider
final touristRouteProvider =
    StateNotifierProvider<TouristRouteNotifier, dynamic>((ref) {
  return TouristRouteNotifier();
});
