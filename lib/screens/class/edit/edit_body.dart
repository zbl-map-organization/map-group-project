import '../../../models/class.dart';
import '../class_viewmodel.dart';
import '../../../screens/view.dart';
import 'package:flutter/material.dart';

import 'edit_screen.dart';

class EditBody extends StatelessWidget {
  void _openEditScreen(context, index, text) async {
    final result = await Navigator.push(
        context, EditScreen.route(index: index, text: text));
    if (result != null) {}
  }

  final int index;
  final bool editbool;
  EditBody(this.index, this.editbool);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SelectorView<ClassViewmodel, Class>(
      selector: (_, vm) => vm.getClass(index),
      builder: (_, vm, _class, __) {
        return Column(children: [
          Container(
            padding: EdgeInsets.all(25.0),
            color: Colors.transparent,
            child: new Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: new Icon(
                Icons.menu_book,
                size: 50,
                color: Colors.white,
              ),
            ),
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
                        classDate: value,
                        classTime: _class.classTime,
                        classLink: _class.classLink,
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
                        classDate: _class.classDate,
                        classTime: value,
                        classLink: _class.classLink,
                      ));
                }),
          ),
          Padding(
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
                        classDate: _class.classDate,
                        classTime: _class.classTime,
                        classLink: value,
                      ));
                }),
          ),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text("Edit".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(110.0),
                                    side: BorderSide(color: Colors.blue)))),
                    onPressed: () => _openEditScreen(context, index, 'Edit'))
              ],
            ),
            visible: !editbool,
          ),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Save".toUpperCase(),
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
                    onPressed: () {
                      _openEditScreen(context, index, 'View');
                    }),
              ],
            ),
            visible: editbool,
          ),
        ]);
      },
    ));
  }
}
