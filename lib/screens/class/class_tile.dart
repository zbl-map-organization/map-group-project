import 'class_viewmodel.dart';
import '../../models/class.dart';
import 'package:flutter/material.dart';

import '../view.dart';
import 'edit/edit_screen.dart';

class ClassTile extends StatelessWidget {
  final int index;
  const ClassTile(this.index);
  void _openEditScreen(context, index, text) async {
    final result = await Navigator.push(
        context, EditScreen.route(index: index, text: text));
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<ClassViewmodel, Class>(
      selector: (_, vm) => vm.getClass(index),
      builder: (_, vm, _class, ___) {
        return ListTile(
          tileColor: Colors.blue[50],
          selectedTileColor: Colors.blue[100],
          title: Text('Date: ${_class.classDate}   Time: ${_class.classTime}'),
          subtitle:
              Text('Status: ${_class.status} \nClass Link:${_class.classLink}'),
          onTap: () => _openEditScreen(context, index, 'View'),
        );
      },
    );
  }
}
