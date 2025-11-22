import 'package:flutter/material.dart';
import '../data/plants.dart';

class MyDropdownMenu extends StatefulWidget {
  const MyDropdownMenu({super.key});

  @override
  State<MyDropdownMenu> createState() => _MyDropdownMenuState();
}

class _MyDropdownMenuState extends State<MyDropdownMenu> {
  String? selectedValue;
  final List<String> options = ["View All", ...plants.map((p) => p.name)];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 350.0,
      initialSelection: selectedValue,
      onSelected: (String? value) {
        setState(() {
          selectedValue = value;
        });
      },
      dropdownMenuEntries: options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
      label: const Text('Select an option'),
    );
  }
}