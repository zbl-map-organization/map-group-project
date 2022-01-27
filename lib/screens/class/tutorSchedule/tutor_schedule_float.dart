import 'package:flutter/material.dart';
import '../../../screens/class/class_viewmodel.dart';
import '../../view.dart';
import 'edit/tutor_schedule_edit_screen.dart';

class TutorScheduleFloat extends StatelessWidget {
  TutorScheduleFloat();

  void _openEditScreen(context, index, text) async {
    final result = await Navigator.push(
        context, TutorScheduleEditScreen.route(index: index, text: text));
    if (result != null) {}
  }

  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, ___) {
      return Visibility(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: Icon(Icons.add),
                tooltip: 'Add a New Class',
                onPressed: () {
                  _openEditScreen(context, vm.list.length, 'Add');
                }),
          ],
        ),
        visible: (vm.getUser(vm.user.uid).userType == "V") ? true : false,
      );
    });
  }
}
