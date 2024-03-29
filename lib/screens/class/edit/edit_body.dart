import '../../../models/class.dart';
import '../class_screen.dart';
import '../class_viewmodel.dart';
import '../../../screens/view.dart';
import 'package:flutter/material.dart';

class EditBody extends StatelessWidget {
  void _openClassScreen(context) async {
    final result = await Navigator.push(context, ClassScreen.route());
    if (result != null) {}
  }

  final int index;
  final bool editbool;
  final bool addbool;
  final bool joinbool;
  EditBody(this.index, this.editbool, this.addbool, this.joinbool);
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
                  enabled: editbool,
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
                    _class.classTitle = value;
                    vm.updateClass(
                        id: vm.getClass(index).id,
                        data: Class(
                          classTitle: value,
                          classDate: _class.classDate,
                          classTime: _class.classTime,
                          classLink: _class.classLink,
                          tutorID: _class.tutorID,
                          studentID: _class.studentID,
                          status: _class.status,
                        ));
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  initialValue: vm.getClass(index).classDate,
                  enabled: editbool,
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
                    _class.classDate = value;
                    vm.updateClass(
                        id: vm.getClass(index).id,
                        data: Class(
                          classTitle: _class.classTitle,
                          classDate: value,
                          classTime: _class.classTime,
                          classLink: _class.classLink,
                          tutorID: _class.tutorID,
                          studentID: _class.studentID,
                          status: _class.status,
                        ));
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 3,
                  initialValue: vm.getClass(index).classTime,
                  enabled: editbool,
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
                    _class.classTime = value;
                    vm.updateClass(
                        id: vm.getClass(index).id,
                        data: Class(
                          classTitle: _class.classTitle,
                          classDate: _class.classDate,
                          classTime: value,
                          classLink: _class.classLink,
                          tutorID: _class.tutorID,
                          studentID: _class.studentID,
                          status: _class.status,
                        ));
                  }),
            ),
            Visibility(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: TextFormField(
                    maxLines: 2,
                    initialValue: vm.getClass(index).classLink,
                    enabled: editbool,
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
                      _class.classLink = value;
                      vm.updateClass(
                          id: vm.getClass(index).id,
                          data: Class(
                            classTitle: _class.classTitle,
                            classDate: _class.classDate,
                            classTime: _class.classTime,
                            classLink: value,
                            tutorID: _class.tutorID,
                            studentID: _class.studentID,
                            status: _class.status,
                          ));
                    }),
              ),
              visible: editbool,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextFormField(
                  maxLines: 1,
                  initialValue: vm.getClass(index).status,
                  enabled: editbool,
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
                    _class.status = value;
                    vm.updateClass(
                        id: vm.getClass(index).id,
                        data: Class(
                          classTitle: _class.classTitle,
                          classDate: _class.classDate,
                          classTime: _class.classTime,
                          classLink: _class.classLink,
                          tutorID: _class.tutorID,
                          studentID: _class.studentID,
                          status: value,
                        ));
                  }),
            ),
            Visibility(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: Text("Join".toUpperCase(),
                          style: TextStyle(fontSize: 12)),
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
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
                              studentID: vm.user.uid,
                              status: "Full",
                            ));
                        _openClassScreen(context);
                      }),
                ],
              ),
              visible: ((vm.getUser(vm.user.uid).userType) == "V")
                  ? false
                  : _class.status == "Available"
                      ? true
                      : false,
            ),
          ],
        );
      },
    )));
  }
}
