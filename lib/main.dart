import 'package:circadia/screens/homeScreen.dart';
// import 'package:circadia/screens/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff6035D0),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
