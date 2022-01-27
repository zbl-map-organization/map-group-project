import 'package:setup_mvvm/screens/class/tutorSchedule/edit/tutor_schedule_edit_screen.dart';

import '../../../../models/class.dart';
import '../tutor_schedule_screen.dart';
import '../../class_viewmodel.dart';
import '../../../view.dart';
import 'package:flutter/material.dart';

class AddClassBody extends StatefulWidget {
  AddClassBody();

  @override
  _AddClassBodyState createState() => _AddClassBodyState();
}

class _AddClassBodyState extends State<AddClassBody> {
  void _openTutorScheduleScreen(context) async {
    final result = await Navigator.push(context, TutorScheduleScreen.route());
    if (result != null) {}
  }

  String classTitle;

  String classDate;

  String classTime;

  String classLink;

  String status;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Center(child: View<ClassViewmodel>(
      builder: (_, vm, ___) {
        return Column(
          children: [
            Image.asset('assets/topicinput.jpg'),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Class Title',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: 'AvenirLight'),
                    hintText: 'Type the Class Title here',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    classTitle = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Class Date',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: 'AvenirLight'),
                    hintText: 'Type the Class Date here',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    classDate = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 3,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Class Time',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: 'AvenirLight'),
                    hintText: 'Type the class time here',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    classTime = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 2,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Class Link',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: 'AvenirLight'),
                    hintText: 'Type the class link here',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    classLink = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 1,
                  style: TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                    labelText: 'Status',
                    labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontFamily: 'AvenirLight'),
                    hintText: 'Type the class status here',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    status = value;
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Cancel".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(110.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () async {
                      _openTutorScheduleScreen(context);
                    }),
                ElevatedButton(
                    child: Text("Add Topic".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(110.0),
                                    side: BorderSide(color: Colors.indigo)))),
                    onPressed: () {
                      vm.addClass(Class(
                          classTitle: classTitle,
                          classDate: classDate,
                          classLink: classLink,
                          classTime: classTime,
                          tutorID: vm.user.uid,
                          status: status));
                      _openTutorScheduleScreen(context);
                    }),
              ],
            ),
          ],
        );
      },
    )));
  }
}
