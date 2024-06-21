import 'package:geolocator/geolocator.dart';

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
    desiredAccuracy: LocationAccuracy.high,
  );
}
