import 'package:circadia/screens/signup_screen.dart';
import 'package:circadia/widgets/instance_binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      theme: ThemeData(
        primaryColor: Color(0xff6035D0),
      ),
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}
