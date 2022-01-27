import '../screens/class/class_screen.dart';
import '../screens/class/edit/edit_screen.dart';

import '../screens/home/home_screen.dart';

import '../screens/topic/input/input_screen.dart';

import '../screens/topic/topic_screen.dart';

import '../screens/user/user_input_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return HomeScreen.route();
    case '/topic':
      return TopicScreen.route();
    case '/inputScreen':
      return InputScreen.route(
          index: settings.arguments['index'], text: settings.arguments['text']);
    case '/class':
      return ClassScreen.route();
    case '/editScreen':
      return EditScreen.route(
          index: settings.arguments['index'], text: settings.arguments['text']);
    case '/userInputScreen':
      return UserInputScreen.route(text: settings.arguments['text']);
  }
  return null;
}
