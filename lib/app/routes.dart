
import '../screens/home/home_screen.dart';

import 'package:flutter/material.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return HomeScreen.route();
  }
  return null;
}
