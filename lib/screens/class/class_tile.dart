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
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Container(
            height: 80,
            color: Colors.grey[200],
            child: Row(
              children: <Widget>[
                Container(
                  color: Colors.indigo,
                  width: 80,
                  height: 80,
                  child: Icon(Icons.school_outlined, color: Colors.white),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Title: ${_class.classTitle}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900])),
                      Text('Date: ${_class.classDate}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800])),
                      Text('Time: ${_class.classTime} ',
                          style: TextStyle(color: Colors.grey[800])),
                      Text('Status :${_class.status}',
                          style: TextStyle(color: Colors.indigo[400])),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.blue,
                  onPressed: () => _openEditScreen(context, index, 'View'),
                )
              ],
            ),
          ),
        );
        //           ListTile(
        //   tileColor: Colors.blue[50],
        //   selectedTileColor: Colors.blue[100],
        //   title: Text('Date: ${_class.classDate}   Time: ${_class.classTime}', ),
        //   subtitle: Text('Status :${_class.status} \nClass Link:${_class.classLink}'),
        //   onTap: () => _openEditScreen(context, index, 'View'),
        // );
      },
    );
  }
}
