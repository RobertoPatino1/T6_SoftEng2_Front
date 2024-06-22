import 'package:flutter/material.dart';
import 'package:open_location_picker/open_location_picker.dart';
import 'package:share_your_route_front/utils/stepper/route_step1.dart';
import 'package:share_your_route_front/utils/stepper/route_step2.dart';
import 'package:share_your_route_front/utils/stepper/route_step3.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  int _currentStep = 0;
  String routeName = '';
  int numberOfPeople = 2;
  int numberOfGuides = 1;
  double rangeAlert = 2;
  bool showPlaceInfo = false;
  String alertSound = 'Sonido 1';
  bool publicRoute = false;
  LatLng? meetingPoint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 25.0,
                color: Color.fromRGBO(45, 75, 115, 1),
                fontWeight: FontWeight.bold,
                height: 1),
            "Crear una nueva ruta"),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          setState(() {
            if (_currentStep < 2) {
              _currentStep++;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: details.onStepContinue,
                child: const Text('Siguiente'),
              ),
              TextButton(
                onPressed: details.onStepCancel,
                child: const Text('Atrás'),
              ),
            ],
          );
        },
        steps: [
          Step(
            title: const Text('Información Inicial'),
            content: RouteStep1(
              routeName: routeName,
              numberOfPeople: numberOfPeople,
              numberOfGuides: numberOfGuides,
              rangeAlert: rangeAlert,
              showPlaceInfo: showPlaceInfo,
              alertSound: alertSound,
              publicRoute: publicRoute,
              onRouteNameChanged: (value) => setState(() {
                routeName = value;
              }),
              onNumberOfPeopleChanged: (value) => setState(() {
                numberOfPeople = value;
                if (numberOfPeople < 1) {
                  numberOfPeople = 1;
                }
              }),
              onNumberOfGuidesChanged: (value) => setState(() {
                numberOfGuides = value;
                if (numberOfGuides < 0) {
                  numberOfGuides = 0;
                }
              }),
              onRangeAlertChanged: (value) => setState(() {
                rangeAlert = value;
              }),
              onShowPlaceInfoChanged: (value) => setState(() {
                showPlaceInfo = value;
              }),
              onAlertSoundChanged: (value) => setState(() {
                alertSound = value;
              }),
              onPublicRouteChanged: (value) => setState(() {
                publicRoute = value;
              }),
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Seleccionar Punto de Encuentro'),
            content: RouteStep2(
              meetingPoint: meetingPoint,
              onMeetingPointChanged: (value) => setState(() {
                meetingPoint = value;
              }),
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Confirmación'),
            content: RouteStep3(
              routeName: routeName,
              numberOfPeople: numberOfPeople,
              numberOfGuides: numberOfGuides,
              rangeAlert: rangeAlert,
              showPlaceInfo: showPlaceInfo,
              alertSound: alertSound,
              publicRoute: publicRoute,
              meetingPoint: meetingPoint,
              onConfirm: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ruta creada')),
                );
              },
              onCancel: () {
                setState(() {
                  _currentStep = 0;
                });
              },
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
    );
  }
}
