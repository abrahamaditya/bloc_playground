import 'package:flutter/material.dart';
import 'package:bloc_playground/screen/example_1.dart';
import 'package:bloc_playground/screen/example_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example2(),
    );
  }
}
