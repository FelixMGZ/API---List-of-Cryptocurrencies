import 'package:flutter/material.dart';

import 'package:proyecto_practica/src/features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: const HomeScreen(),
    debugShowCheckedModeBanner: false,
    );
  }
}