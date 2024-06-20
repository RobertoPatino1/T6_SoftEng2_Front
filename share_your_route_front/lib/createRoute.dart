import 'package:flutter/material.dart';

class CreateRoute extends StatefulWidget {
  const CreateRoute({super.key});

  @override
  State<CreateRoute> createState() => _CreateRouteState();
}

class _CreateRouteState extends State<CreateRoute> {
  String routeName = '';
  Map<String, int> counters = {
    'numberOfPeople': 2,
    'numberOfGuides': 1,
  };
  double rangeAlert = 2;
  bool showPlaceInfo = false;
  String alertSound = 'Sonido 1';
  bool makeItPublic = false;

  TextStyle labelTextStyle = const TextStyle(
    fontSize: 16,
    color: Color.fromRGBO(37, 60, 89, 1),
  );

  void updateCounter(String key, int delta) {
    setState(() {
      if (counters[key]! + delta > 0) {
        counters[key] = counters[key]! + delta;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Crear una nueva ruta',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 60, 89, 1),
                ),
              ),
              const SizedBox(height: 20),
              buildRouteNameField(),
              const SizedBox(height: 15),
              buildLabeledControl(
                  'Cantidad de Personas', buildNumberChanger('numberOfPeople')),
              const SizedBox(height: 15),
              buildLabeledControl(
                  'Número de guías', buildNumberChanger('numberOfGuides')),
              const SizedBox(height: 15),
              buildLabeledControl('Rango de Alerta', buildRangeSlider()),
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
              buildLabeledControl('Sonido de Alerta', buildDropdown()),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Ruta pública', style: labelTextStyle),
                value: makeItPublic,
                onChanged: (bool value) {
                  setState(() {
                    makeItPublic = value;
                  });
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                leading: const Icon(Icons.location_pin,
                    color: Color.fromRGBO(37, 60, 89, 1)),
                title: Text('Fijar punto de encuentro', style: labelTextStyle),
                trailing: IconButton(
                  icon: const Icon(Icons.add,
                      color: Color.fromRGBO(37, 60, 89, 1)),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí puedes añadir la lógica para crear la ruta
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(37, 60, 89, 1),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Crear',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRouteNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nombre de la Ruta', style: labelTextStyle),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
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
        Text('${counters[key]}', style: labelTextStyle),
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
