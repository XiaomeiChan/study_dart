import 'package:flutter/material.dart';
import 'package:tempat_wisata/main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}

