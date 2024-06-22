import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_location_picker/open_location_picker.dart';
import 'package:share_your_route_front/services/location_service.dart';
import 'package:share_your_route_front/utils/widgets/create_route_widgets.dart';

class RouteStep2 extends StatelessWidget {
  final LatLng? meetingPoint;
  final Function(LatLng?) onMeetingPointChanged;

  const RouteStep2({
    super.key,
    required this.meetingPoint,
    required this.onMeetingPointChanged,
  });

  @override
  Widget build(BuildContext context) {
    return OpenMapSettings(
      onError: (context, error) {},
      getCurrentLocation: LocationService.determinePosition,
      reverseZoom: ReverseZoom.building,
      getLocationStream: () => Geolocator.getPositionStream()
          .map((event) => LatLng(event.latitude, event.longitude)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpenMapPicker(
            decoration: const InputDecoration(
              hintText: "Mi ubicación",
            ),
            onSaved: (FormattedLocation? newValue) {
              onMeetingPointChanged(newValue?.toLatLng());
            },
          ),
          const SizedBox(height: 15),
          if (meetingPoint != null)
            Text(
              'Punto de Encuentro: ${meetingPoint!.latitude}, ${meetingPoint!.longitude}',
              style: labelTextStyle,
            ),
        ],
      ),
    );
  }
}
