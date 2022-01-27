import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/class.dart';
import '../../screens/class/class_viewmodel.dart';
import '../view.dart';
import 'edit/edit_screen.dart';

class Float extends StatelessWidget {
  Float();

  void _openEditScreen(context, index, text) async {
    final result = await Navigator.push(
        context, EditScreen.route(index: index, text: text));
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
                  vm.addClass(Class());
                  _openEditScreen(context, vm.list.length, 'Add');
                }),
          ],
        ),
        visible: (vm.getUser(vm.user.uid).userType == "V") ? true : false,
      );
    });
  }
}
