import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_drawer.dart';
import '../../../view.dart';
import '../../class_viewmodel.dart';
import 'student_schedule_edit_app_bar.dart';
import 'student_schedule_edit_body.dart';

// ignore: must_be_immutable
class StudentScheduleEditScreen extends StatefulWidget {
  static Route route({index}) =>
      MaterialPageRoute(builder: (context) => StudentScheduleEditScreen(index));

  bool editbool = true;
  bool addbool = false;
  bool joinbool = false;
  final int index;
  StudentScheduleEditScreen(this.index);

  @override
  _StudentScheduleEditScreenState createState() =>
      _StudentScheduleEditScreenState();
}

class _StudentScheduleEditScreenState extends State<StudentScheduleEditScreen> {
  @override
  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: StudentScheduleEditAppBar(),
        drawer: HomeDrawer(),
        body: StudentScheduleEditBody(widget.index),
      );
    });
  }
}
