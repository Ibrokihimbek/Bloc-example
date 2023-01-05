import 'package:bloc_example/screens/upper_case/upper_case_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpperCasePage(),
    );
  }
}
