import 'package:flutter/material.dart';
import '../../view.dart';
import '../topic_viewmodel.dart';
import 'input_app_bar.dart';
import 'input_body.dart';
import 'input_drawer.dart';

class InputScreen extends StatelessWidget {
  final String text;
  bool editbool = true;
  final int index;

  InputScreen(this.index, this.text) {
    if (text == 'View') {
      editbool = false;
    }
  }

  static Route route({index, text}) =>
      MaterialPageRoute(builder: (context) => InputScreen(index, text));
  @override
  Widget build(BuildContext context) {
    return View<TopicViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: InputAppBar(text),
        drawer: InputDrawer(),
        body: InputBody(index, editbool),
      );
    });
  }
}
