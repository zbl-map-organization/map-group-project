import 'package:flutter/material.dart';
import '../../models/topic.dart';
import '../../screens/topic/topic_viewmodel.dart';
import '../view.dart';
import 'input/input_screen.dart';

class TopicFloat extends StatelessWidget {
  TopicFloat();

  void _openInputScreen(context, index, text) async {
    final result = await Navigator.push(
        context, InputScreen.route(index: index, text: text));
    if (result != null) {}
  }

  Widget build(BuildContext context) {
    return View<TopicViewmodel>(builder: (_, vm, ___) {
      return Visibility(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: Icon(Icons.add),
                tooltip: 'Add a New Topic',
                onPressed: () {
                  _openInputScreen(context, vm.list.length, 'Add');
                }),
          ],
        ),
        visible: (vm.getUser(vm.user.uid).userType == "V") ? true : false,
      );
    });
  }
}
