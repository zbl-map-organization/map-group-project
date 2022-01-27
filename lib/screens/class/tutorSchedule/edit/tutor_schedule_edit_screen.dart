import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_drawer.dart';
import '../../../view.dart';
import '../../class_viewmodel.dart';
import 'add_class_body.dart';
import 'edit_app_bar.dart';
import 'tutor_schedule_edit_body.dart';

// ignore: must_be_immutable
class TutorScheduleEditScreen extends StatefulWidget {
  static Route route({index, text}) => MaterialPageRoute(
      builder: (context) => TutorScheduleEditScreen(index, text));

  final String text;
  bool editbool = true;
  bool addbool = false;
  bool joinbool = false;
  final int index;
  TutorScheduleEditScreen(this.index, this.text) {
    if (text == 'View') {
      editbool = false;
    } else if (text == 'Add') {
      addbool = true;
    } else if (text == 'Join') {
      joinbool = true;
    }
  }

  @override
  _TutorScheduleEditScreenState createState() =>
      _TutorScheduleEditScreenState();
}

class _TutorScheduleEditScreenState extends State<TutorScheduleEditScreen> {
  @override
  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: EditAppBar(widget.text),
        drawer: HomeDrawer(),
        body: widget.addbool
            ? AddClassBody()
            : EditBody(
                widget.index, widget.editbool, widget.addbool, widget.joinbool),
      );
    });
  }
}
