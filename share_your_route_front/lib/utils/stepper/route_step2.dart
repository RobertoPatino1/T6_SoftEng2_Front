import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/utils/widgets/create_route_widgets.dart';
import 'package:share_your_route_front/location_picker_screen.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LocationPickerScreen(
                  onLocationSelected: onMeetingPointChanged,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(45, 75, 115, 1),
          ),
          child: const Text(
            'Seleccionar en el mapa',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(height: 15),
        if (meetingPoint != null)
          Text(
            'Punto de Encuentro: ${meetingPoint!.latitude}, ${meetingPoint!.longitude}',
            style: labelTextStyle,
          ),
      ],
    );
  }
}
