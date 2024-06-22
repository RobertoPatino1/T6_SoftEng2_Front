import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_location_picker/open_location_picker.dart';

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

  TextStyle labelTextStyle = const TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(37, 60, 89, 1),
  );

  Future<LatLng> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    final data = await Geolocator.getCurrentPosition();
    return LatLng(data.latitude, data.longitude);
  }

  void updateCounter(String key, int delta) {
    setState(() {
      if (key == 'numberOfPeople') {
        numberOfPeople += delta;
        if (numberOfPeople < 1) numberOfPeople = 1;
      } else if (key == 'numberOfGuides') {
        numberOfGuides += delta;
        if (numberOfGuides < 0) numberOfGuides = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Crear una nueva Ruta',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
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
        steps: [
          Step(
            title: const Text('Información Inicial'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                buildRouteNameField(),
                const SizedBox(height: 15),
                buildLabeledControl(
                  'Cantidad de Personas',
                  buildNumberChanger('numberOfPeople'),
                ),
                const SizedBox(height: 15),
                buildLabeledControl(
                  'Número de guías',
                  buildNumberChanger('numberOfGuides'),
                ),
                const SizedBox(height: 15),
                buildLabeledControl('Rango de Alerta', buildRangeSlider()),
                const SizedBox(height: 15),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Mostrar información del lugar',
                    style: labelTextStyle,
                  ),
                  value: showPlaceInfo,
                  onChanged: (bool value) {
                    setState(() {
                      showPlaceInfo = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                buildLabeledControl('Sonido de Alerta', buildDropdown()),
                const SizedBox(height: 15),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Ruta pública', style: labelTextStyle),
                  value: publicRoute,
                  onChanged: (bool value) {
                    setState(() {
                      publicRoute = value;
                    });
                  },
                ),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Seleccionar Punto de Encuentro'),
            content: OpenMapSettings(
              onError: (context, error) {},
              getCurrentLocation: _determinePosition,
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
                      setState(() {
                        meetingPoint = newValue?.toLatLng();
                      });
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
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('Confirmación'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Resumen de la Ruta', style: labelTextStyle),
                const Divider(),
                Text('Nombre de la Ruta: $routeName', style: labelTextStyle),
                const SizedBox(height: 8),
                Text(
                  'Número de Personas: $numberOfPeople',
                  style: labelTextStyle,
                ),
                const SizedBox(height: 8),
                Text('Número de Guías: $numberOfGuides', style: labelTextStyle),
                const SizedBox(height: 8),
                Text(
                  'Rango de Alerta: ${rangeAlert.round()}',
                  style: labelTextStyle,
                ),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para confirmar la creación de la ruta
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Ruta creada')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para cancelar la creación de la ruta
                        setState(() {
                          _currentStep = 0; // Reiniciar el stepper
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text(
                  'Continuar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: details.onStepCancel,
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildRouteNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nombre de la Ruta', style: labelTextStyle),
        const SizedBox(height: 8),
        TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Ingrese el nombre de la ruta',
          ),
          onChanged: (value) {
            setState(() {
              routeName = value;
            });
          },
        ),
      ],
    );
  }

  Widget buildLabeledControl(String label, Widget control) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelTextStyle),
        control,
      ],
    );
  }

  Widget buildNumberChanger(String key) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove, color: Color.fromRGBO(37, 60, 89, 1)),
          onPressed: () => updateCounter(key, -1),
        ),
        Text(
          '${key == 'numberOfPeople' ? numberOfPeople : numberOfGuides}',
          style: labelTextStyle,
        ),
        IconButton(
          icon: const Icon(Icons.add, color: Color.fromRGBO(37, 60, 89, 1)),
          onPressed: () => updateCounter(key, 1),
        ),
      ],
    );
  }

  Widget buildRangeSlider() {
    return Slider(
      value: rangeAlert,
      min: 1,
      max: 10,
      divisions: 9,
      label: rangeAlert.round().toString(),
      onChanged: (double value) {
        setState(() {
          rangeAlert = value;
        });
      },
    );
  }

  Widget buildDropdown() {
    return DropdownButton<String>(
      value: alertSound,
      onChanged: (String? newValue) {
        setState(() {
          alertSound = newValue!;
        });
      },
      items: <String>['Sonido 1', 'Sonido 2', 'Sonido 3']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: labelTextStyle),
        );
      }).toList(),
    );
  }
}
