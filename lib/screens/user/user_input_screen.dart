import '../../screens/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import '../home/home_drawer.dart';
import '../view.dart';
import 'user_input_app_bar.dart';
import 'user_input_body.dart';

// ignore: must_be_immutable
class UserInputScreen extends StatelessWidget {
  static Route route({text}) =>
      MaterialPageRoute(builder: (context) => UserInputScreen(text));

  final String text;
  bool editbool = true;
  dynamic index;

  UserInputScreen(this.text) {
    if (text == 'View') {
      editbool = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return View<UserViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: UserInputAppBar(text),
        drawer: HomeDrawer(),
        body: UserInputBody(editbool),
      );
    });
  }
}
