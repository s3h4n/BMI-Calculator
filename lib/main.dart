import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'package:zodz_bmi_calculator/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: KApp.kName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KColor.kPrimaryColor),
        useMaterial3: true,
        fontFamily: KFont.kPrimaryFamily,
      ),
      home: const HomeScreen(),
    );
  }
}
