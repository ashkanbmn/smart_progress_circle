import 'package:flutter/material.dart';
import 'package:smart_progress_circle/smart_progress_circle.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Progress Circle'),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressBar(
            minValue: 0,
            maxValue: 10,
            initialValue: 0,
            icon: Icon(
              Icons.speed,
              color: Colors.red,
            ),
            calculationCriteria: 'Speed',
          ),
        ),
      ),
    );
  }
}
