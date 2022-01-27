import '../../../../models/class.dart';
import '../../class_viewmodel.dart';
import '../../../view.dart';
import 'package:flutter/material.dart';

import '../studSchedule_screen.dart';

class StudentScheduleEditBody extends StatelessWidget {
  void _openStudScheduleScreen(context) async {
    final result = await Navigator.push(context, StudScheduleScreen.route());
    if (result != null) {}
  }

  final int index;

  StudentScheduleEditBody(this.index);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: SelectorView<ClassViewmodel, Class>(
      selector: (_, vm) => vm.getClass(index),
      builder: (_, vm, _class, __) {
        return Column(
          children: [
            Image.asset('assets/topicinput.jpg'),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  initialValue: vm.getClass(index).classTitle,
                  enabled: false,
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
                  onChanged: (value) {}),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  initialValue: vm.getClass(index).classDate,
                  enabled: false,
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
                  onChanged: (value) {}),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 3,
                  initialValue: vm.getClass(index).classTime,
                  enabled: false,
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
                  onChanged: (value) {}),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 2,
                  initialValue: vm.getClass(index).classLink,
                  enabled: false,
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
                  onChanged: (value) {}),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 1,
                  initialValue: vm.getClass(index).status,
                  enabled: false,
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
                  onChanged: (value) {}),
            ),
            Visibility(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: Text("Cancel".toUpperCase(),
                          style: TextStyle(fontSize: 12)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(10)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(110.0),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {
                        vm.updateClass(
                            id: vm.getClass(index).id,
                            data: Class(
                              classTitle: _class.classTitle,
                              classDate: _class.classDate,
                              classTime: _class.classTime,
                              classLink: _class.classLink,
                              tutorID: _class.tutorID,
                              studentID: null,
                              status: "Available",
                            ));
                        _openStudScheduleScreen(context);
                      }),
                  SizedBox(width: 50.0),
                ],
              ),
              visible: (vm.getClass(index).status == "Full") ? true : false,
            ),
          ],
        );
      },
    )));
  }
}
