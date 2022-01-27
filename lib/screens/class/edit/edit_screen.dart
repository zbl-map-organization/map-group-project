import 'package:flutter/material.dart';
import '../../view.dart';
import '../class_viewmodel.dart';
import 'edit_app_bar.dart';
import 'edit_body.dart';
import 'edit_drawer.dart';

class EditScreen extends StatelessWidget {
  static Route route({index, text}) =>
      MaterialPageRoute(builder: (context) => EditScreen(index, text));

  final String text;
  bool editbool = true;
  int index;

  EditScreen(this.index, this.text) {
    if (text == 'View') {
      editbool = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: EditAppBar(text),
        drawer: EditDrawer(),
        body: EditBody(index, editbool),
      );
    });
  }
}
