import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:share_your_route_front/utils/widgets/create_route_widgets.dart';

class RouteStep3 extends StatelessWidget {
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

  const RouteStep3({
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Resumen de la Ruta', style: labelTextStyle),
        const Divider(),
        Text('Nombre de la Ruta: $routeName', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Número de Personas: $numberOfPeople', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Número de Guías: $numberOfGuides', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Rango de Alerta: ${rangeAlert.round()}', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Mostrar Información del Lugar: ${showPlaceInfo ? 'Sí' : 'No'}',
            style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Sonido de Alerta: $alertSound', style: labelTextStyle),
        const SizedBox(height: 8),
        Text('Ruta Pública: ${publicRoute ? 'Sí' : 'No'}',
            style: labelTextStyle),
        const SizedBox(height: 8),
        Text(
            'Punto de Encuentro: ${meetingPoint != null ? '${meetingPoint!.latitude}, ${meetingPoint!.longitude}' : 'No seleccionado'}',
            style: labelTextStyle),
        // const SizedBox(height: 20),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     ElevatedButton(
        //       onPressed: onConfirm,
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.green,
        //       ),
        //       child: const Text('Confirmar'),
        //     ),
        //     ElevatedButton(
        //       onPressed: onCancel,
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: Colors.red,
        //       ),
        //       child: const Text('Cancelar'),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
