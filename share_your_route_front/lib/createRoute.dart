import 'package:flutter/material.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({Key? key}) : super(key: key);

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

  TextStyle labelTextStyle = const TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(37, 60, 89, 1),
  );

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
        title: const Text('Crear una nueva Ruta'),
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
                buildLabeledControl('Cantidad de Personas',
                    buildNumberChanger('numberOfPeople')),
                const SizedBox(height: 15),
                buildLabeledControl(
                    'Número de guías', buildNumberChanger('numberOfGuides')),
                const SizedBox(height: 15),
                buildLabeledControl('Rango de Alerta', buildRangeSlider()),
                const SizedBox(height: 15),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text('Mostrar información del lugar',
                      style: labelTextStyle),
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
            content: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('It works!'),
                // Aquí se puede integrar un mapa para seleccionar el punto de encuentro
              ],
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
                Text('Número de Personas: $numberOfPeople',
                    style: labelTextStyle),
                const SizedBox(height: 8),
                Text('Número de Guías: $numberOfGuides', style: labelTextStyle),
                const SizedBox(height: 8),
                Text('Rango de Alerta: ${rangeAlert.round()}',
                    style: labelTextStyle),
                const SizedBox(height: 8),
                Text(
                    'Mostrar Información del Lugar: ${showPlaceInfo ? 'Sí' : 'No'}',
                    style: labelTextStyle),
                const SizedBox(height: 8),
                Text('Sonido de Alerta: $alertSound', style: labelTextStyle),
                const SizedBox(height: 8),
                Text('Ruta Pública: ${publicRoute ? 'Sí' : 'No'}',
                    style: labelTextStyle),
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
                      child: const Text('Confirmar'),
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
                      child: const Text('Cancelar'),
                    ),
                  ],
                ),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
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
        Text('${key == 'numberOfPeople' ? numberOfPeople : numberOfGuides}',
            style: labelTextStyle),
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
