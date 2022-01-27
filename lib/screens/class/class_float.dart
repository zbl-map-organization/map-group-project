import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/class.dart';
import '../../screens/class/class_viewmodel.dart';
import '../view.dart';


class Float extends StatelessWidget {
  Float();

  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, ___) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a New Class',
            onPressed: () =>
                vm.addClass(Class(classDate: "xx/xx/xx", classTime: "xxxx-xxxx", classLink: "xxx"))
          ),
        ],
      );
    });
  }
}
