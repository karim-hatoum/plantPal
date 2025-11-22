import 'package:flutter/material.dart';
import '../widgets/dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Plant Pal', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 25.0),
            MyDropdownMenu(),
            SizedBox(height: 50.0),
            
          ],
        ),
      ),
    );
  }
}