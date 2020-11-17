import 'package:flutter/material.dart';
import 'Calculator.dart';
import 'Convert.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          canvasColor: Colors.black,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Calculator(),
          '/convert': (context) => Convert(),
        });
  }
}
