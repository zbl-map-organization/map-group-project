import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/service_locator.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeServiceLocator();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MAP Project',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: Color.fromARGB(255, 5, 28, 48),
    ),
    home: HomeScreen(),
  ));
}

// identify usertype
//tutor student schedule
// improve ui