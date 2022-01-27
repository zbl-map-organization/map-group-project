import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/service_locator.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeServiceLocator();

  runApp(MaterialApp(
    title: 'Flutter List App Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // home: LoginScreen(),
    home: HomeScreen(),
  ));
}
