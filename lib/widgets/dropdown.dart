import 'package:flutter/material.dart';
import '../data/plants.dart';

class MyDropdownMenu extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  const MyDropdownMenu({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> options = ["View All", ...plants.map((p) => p.name)];
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: options.contains(selectedValue)
                  ? selectedValue
                  : "View All",
              onChanged: onChanged,
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.green,
                size: 32,
              ),
              borderRadius: BorderRadius.circular(16),
              dropdownColor: Colors.white,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_florist,
                        color: Colors.green[400],
                        size: 22,
                      ),
                      const SizedBox(width: 10),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
