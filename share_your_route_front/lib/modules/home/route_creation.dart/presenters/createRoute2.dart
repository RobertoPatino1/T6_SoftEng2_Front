import 'package:flutter/material.dart';

class CreateRoute2 extends StatefulWidget {
  const CreateRoute2({super.key});

  @override
  State<CreateRoute2> createState() => _CreateRoute2State();
}

class _CreateRoute2State extends State<CreateRoute2> {
  int numberOfPeople = 2;
  double rangeAlert = 2;
  bool showPlaceInfo = false;
  String alertSound = 'Sonido 1';
  bool makeItPublic = false;

  TextStyle labelTextStyle = const TextStyle(
    fontSize: 16, // Adjusted size to match other labels
    color: Color.fromRGBO(37, 60, 89, 1), // Color set to dark blue
  );

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
                'Ruta: Mi Ruta De Cuenca',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(37, 60, 89, 1),
                ),
              ),
              const SizedBox(height: 20),
              buildLabeledControl('Cantidad de Personas', buildNumberChanger()),
              buildLabeledControl('Rango de Alerta', buildNumberChanger()),
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
              buildLabeledControl('Sonido de Alerta', buildDropdown()),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Hacerlo Público', style: labelTextStyle),
                value: makeItPublic,
                onChanged: (bool value) {
                  setState(() {
                    makeItPublic = value;
                  });
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                leading: const Icon(
                  Icons.location_pin,
                  color: Color.fromRGBO(37, 60, 89, 1),
                ),
                title: Text('Fijar punto de encuentro', style: labelTextStyle),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Color.fromRGBO(37, 60, 89, 1),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(37, 60, 89, 1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Crear',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget buildNumberChanger() {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove, color: Color.fromRGBO(37, 60, 89, 1)),
          onPressed: () {
            setState(() {
              if (numberOfPeople > 1) numberOfPeople--;
            });
          },
        ),
        Text('$numberOfPeople', style: labelTextStyle),
        IconButton(
          icon: const Icon(Icons.add, color: Color.fromRGBO(37, 60, 89, 1)),
          onPressed: () {
            setState(() {
              numberOfPeople++;
            });
          },
        ),
      ],
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
