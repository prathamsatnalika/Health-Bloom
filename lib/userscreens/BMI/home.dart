import 'package:flutter/material.dart';
import 'package:health_bloom/userscreens/BMI/screens/calculator_screen.dart';

class BmiCal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: CalculatorScreen(),
    );

  }
}
