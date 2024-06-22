import 'package:flutter/material.dart';
import 'package:share_your_route_front/core/widgets/create_route_widgets.dart';

class RouteStep1 extends StatelessWidget {
  final String routeName;
  final int numberOfPeople;
  final int numberOfGuides;
  final double rangeAlert;
  final bool showPlaceInfo;
  final String alertSound;
  final bool publicRoute;
  final Function(String) onRouteNameChanged;
  final Function(int) onNumberOfPeopleChanged;
  final Function(int) onNumberOfGuidesChanged;
  final Function(double) onRangeAlertChanged;
  final Function(bool) onShowPlaceInfoChanged;
  final Function(String) onAlertSoundChanged;
  final Function(bool) onPublicRouteChanged;

  const RouteStep1({
    super.key,
    required this.routeName,
    required this.numberOfPeople,
    required this.numberOfGuides,
    required this.rangeAlert,
    required this.showPlaceInfo,
    required this.alertSound,
    required this.publicRoute,
    required this.onRouteNameChanged,
    required this.onNumberOfPeopleChanged,
    required this.onNumberOfGuidesChanged,
    required this.onRangeAlertChanged,
    required this.onShowPlaceInfoChanged,
    required this.onAlertSoundChanged,
    required this.onPublicRouteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        buildRouteNameField(routeName, onRouteNameChanged),
        const SizedBox(height: 15),
        buildLabeledControl('Cantidad de Personas',
            buildNumberChanger(numberOfPeople, onNumberOfPeopleChanged)),
        const SizedBox(height: 15),
        buildLabeledControl('Número de guías',
            buildNumberChanger(numberOfGuides, onNumberOfGuidesChanged)),
        const SizedBox(height: 15),
        buildLabeledControl('Rango de Alerta',
            buildRangeSlider(rangeAlert, onRangeAlertChanged)),
        const SizedBox(height: 15),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Mostrar información del lugar',
              style: labelTextStyle),
          value: showPlaceInfo,
          onChanged: onShowPlaceInfoChanged,
          activeColor: const Color.fromRGBO(191, 141, 48, 1),
        ),
        const SizedBox(height: 15),
        buildLabeledControl(
            'Sonido de Alerta', buildDropdown(alertSound, onAlertSoundChanged)),
        const SizedBox(height: 15),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Ruta pública'),
          value: publicRoute,
          onChanged: onPublicRouteChanged,
          activeColor: const Color.fromRGBO(191, 141, 48, 1),
        ),
      ],
    );
  }
}
