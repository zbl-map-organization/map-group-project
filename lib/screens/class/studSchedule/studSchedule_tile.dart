import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/class.dart';
import '../../view.dart';
import '../class_viewmodel.dart';
import 'edit/student_schedule_edit_screen.dart';

class StudScheduleTile extends StatelessWidget {
  final int index;
  const StudScheduleTile(this.index);
  void _openStudentScheduleEditScreen(context, index) async {
    final result = await Navigator.push(
        context, StudentScheduleEditScreen.route(index: index));
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<ClassViewmodel, Class>(
      selector: (_, vm) => vm.getClass(index),
      builder: (_, vm, _class, ___) {
        return Visibility(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: Container(
              height: 80,
              color: Colors.grey[200],
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.indigo,
                    width: 80,
                    height: 80,
                    child: Icon(Icons.menu_book, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${_class.classTitle}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800])),
                        Text('Date ${_class.classDate}',
                            style: TextStyle(color: Colors.grey[800])),
                        Text('Time ${_class.classTime}',
                            style: TextStyle(color: Colors.grey[800])),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Colors.blue,
                    onPressed: () =>
                        _openStudentScheduleEditScreen(context, index),
                  )
                ],
              ),
            ),
          ),
          visible: _class.studentID == vm.user.uid ? true : false,
        );
      },
    );
  }
}
