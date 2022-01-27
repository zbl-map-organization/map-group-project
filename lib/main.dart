import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/service_locator.dart';
import 'screens/home/home_screen.dart';
import '../app/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeServiceLocator();

  runApp(MaterialApp(
    title: 'Flutter List App Demo',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigo[800],
    ),
    // home: LoginScreen(),
    initialRoute: '/',
    onGenerateRoute: createRoute,
  ));
}
