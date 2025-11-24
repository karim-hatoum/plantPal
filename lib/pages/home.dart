import 'package:flutter/material.dart';

import '../widgets/dropdown.dart';
import '../data/plants.dart';
import '../widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedPlant;

  List get _filteredPlants {
    if (_selectedPlant == null || _selectedPlant == "View All") {
      return plants;
    }
    return plants.where((p) => p.name == _selectedPlant).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Plant Pal',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25.0),
          MyDropdownMenu(
            selectedValue: _selectedPlant ?? "View All",
            onChanged: (value) {
              setState(() {
                _selectedPlant = value;
              });
            },
          ),
          const SizedBox(height: 50.0),
          // Display filtered plant cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: _filteredPlants.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: PlantCard(plant: _filteredPlants[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
