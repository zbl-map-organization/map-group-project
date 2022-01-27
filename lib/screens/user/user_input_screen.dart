import '../../screens/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import '../view.dart';
import 'user_input_app_bar.dart';
import 'user_input_body.dart';

class UserInputScreen extends StatelessWidget {
  static Route route({index, text}) =>
      MaterialPageRoute(builder: (context) => UserInputScreen(index, text));

  final String text;
  bool editbool = true;
  dynamic index;

  UserInputScreen(this.index, this.text) {
    if (text == 'View') {
      editbool = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return View<UserViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: UserInputAppBar(text),
        body: InputBody(index, editbool),
      );
    });
  }
}
