import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/core/widgets/create_route_widgets.dart';
import 'package:share_your_route_front/modules/home/route_creation.dart/location_picker/location_picker_screen.dart';

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
                  onLocationSelected: (LatLng? location) {
                    onMeetingPointChanged(location);
                    Navigator.pop(
                        context); // Close the picker screen after selection
                  },
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
