import 'package:flutter/material.dart';
import '../../view.dart';
import '../class_viewmodel.dart';
import 'add_class_body.dart';
import 'edit_app_bar.dart';
import '../../home/home_drawer.dart';
import 'edit_body.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  static Route route({index, text}) =>
      MaterialPageRoute(builder: (context) => EditScreen(index, text));

  final String text;
  bool editbool = true;
  bool addbool = false;
  bool joinbool = false;
  final int index;
  EditScreen(this.index, this.text) {
    if (text == 'View') {
      editbool = false;
    } else if (text == 'Add') {
      addbool = true;
    
    } else if (text == 'Join') {
      joinbool = true;
    }
  }

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: EditAppBar(widget.text),
        drawer: HomeDrawer(),
        body: widget.addbool
            ? AddClassBody()
            : EditBody(widget.index, widget.editbool, widget.addbool, widget.joinbool),
      );
    });
  }
}
