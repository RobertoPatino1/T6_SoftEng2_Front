import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/core/widgets/create_route_widgets.dart';
import 'package:share_your_route_front/modules/route_creation/presenters/location_picker_screen.dart';

class RouteStep2 extends StatefulWidget {
  final LatLng? meetingPoint;
  final Function(LatLng?) onMeetingPointChanged;

  const RouteStep2({
    super.key,
    required this.meetingPoint,
    required this.onMeetingPointChanged,
  });

  @override
  State<RouteStep2> createState() => _RouteStep2State();
}

class _RouteStep2State extends State<RouteStep2> {
  LatLng? selectedPosition;

  @override
  void initState() {
    super.initState();
    selectedPosition = widget.meetingPoint;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => LocationPickerScreen(
                  onLocationSelected: (location) {
                    setState(() {
                      selectedPosition = location;
                    });
                  },
                ),
              ),
            );

            if (result != null && result is LatLng) {
              widget.onMeetingPointChanged(result);
            }
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
        if (selectedPosition != null)
          Text(
            'Punto de Encuentro: ${selectedPosition!.latitude}, ${selectedPosition!.longitude}',
            style: labelTextStyle,
          ),
      ],
    );
  }
}
