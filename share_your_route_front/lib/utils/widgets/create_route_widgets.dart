import 'package:flutter/material.dart';

const TextStyle labelTextStyle = TextStyle(
  fontSize: 16,
  color: Color.fromRGBO(45, 75, 115, 1),
);

Widget buildRouteNameField(
    String routeName, Function(String) onRouteNameChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Nombre de la Ruta', style: labelTextStyle),
      const SizedBox(height: 8),
      TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Ingrese el nombre de la ruta',
        ),
        onChanged: onRouteNameChanged,
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

Widget buildNumberChanger(int value, Function(int) onChanged) {
  return Row(
    children: [
      IconButton(
        icon: const Icon(Icons.remove, color: Color.fromRGBO(45, 75, 115, 1)),
        onPressed: () => onChanged(value - 1),
      ),
      Text('$value', style: labelTextStyle),
      IconButton(
        icon: const Icon(Icons.add, color: Color.fromRGBO(45, 75, 115, 1)),
        onPressed: () => onChanged(value + 1),
      ),
    ],
  );
}

Widget buildRangeSlider(double value, Function(double) onChanged) {
  return Slider(
      value: value,
      min: 1,
      max: 10,
      divisions: 9,
      label: value.round().toString(),
      onChanged: onChanged,
      thumbColor: const Color.fromRGBO(191, 141, 48, 1),
      secondaryActiveColor: const Color.fromRGBO(45, 75, 115, 1),
      activeColor: const Color.fromRGBO(45, 75, 115, 1),
      inactiveColor: const Color.fromARGB(255, 137, 137, 137));
}

Widget buildDropdown(String value, Function(String) onChanged) {
  return DropdownButton<String>(
    value: value,
    onChanged: (String? newValue) {
      if (newValue != null) {
        onChanged(newValue);
      }
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
