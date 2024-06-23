import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/core/widgets/create_route_widgets.dart';

class RouteStep4 extends StatelessWidget {
  final String routeName;
  final int numberOfPeople;
  final int numberOfGuides;
  final double rangeAlert;
  final bool showPlaceInfo;
  final String alertSound;
  final bool publicRoute;
  final LatLng? meetingPoint;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final List<Map<String, dynamic>> stops;

  const RouteStep4({
    super.key,
    required this.routeName,
    required this.numberOfPeople,
    required this.numberOfGuides,
    required this.rangeAlert,
    required this.showPlaceInfo,
    required this.alertSound,
    required this.publicRoute,
    required this.meetingPoint,
    required this.onConfirm,
    required this.onCancel,
    required this.stops,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Resumen de la Ruta', style: titlelabelTextStyle),
        const Divider(),
        Text('Nombre de la Ruta: $routeName', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Número de Personas: $numberOfPeople', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Número de Guías: $numberOfGuides', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Rango de Alerta: ${rangeAlert.round()}', style: labelTextStyle),
        const SizedBox(height: 8),
        Text(
          'Mostrar Información del Lugar: ${showPlaceInfo ? 'Sí' : 'No'}',
          style: labelTextStyle,
        ),
        const SizedBox(height: 8),
        Text('Sonido de Alerta: $alertSound', style: labelTextStyle),
        const SizedBox(height: 8),
        Text(
          'Ruta Pública: ${publicRoute ? 'Sí' : 'No'}',
          style: labelTextStyle,
        ),
        const SizedBox(height: 8),
        Text(
          'Punto de Encuentro: ${meetingPoint != null ? '${meetingPoint!.latitude}, ${meetingPoint!.longitude}' : 'No seleccionado'}',
          style: labelTextStyle,
        ),
        const SizedBox(height: 8),
        const Text('Paradas:', style: titlelabelTextStyle),
        if (stops.isEmpty)
          const Text('No se han seleccionado paradas', style: labelTextStyle)
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(stops.length, (index) {
              final stop = stops[index];
              final stopName = stop['name'];
              final stopTime = stop['time'] as TimeOfDay;
              return Text(
                'Parada ${index + 1}: $stopName - ${stopTime.format(context)}',
                style: labelTextStyle,
              );
            }),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
