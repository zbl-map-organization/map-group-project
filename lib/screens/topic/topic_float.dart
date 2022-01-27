import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/topic.dart';
import '../../screens/topic/topic_viewmodel.dart';
import '../view.dart';
import 'input/input_screen.dart';

class TopicFloat extends StatelessWidget {
  TopicFloat();

  Widget build(BuildContext context) {
    return View<TopicViewmodel>(builder: (_, vm, ___) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a New Topic',
            onPressed: () => vm.addTopic(Topic(
                title: 'Add Title',
                desc: 'Add Desc',
                link: 'Add Link',
                formLvl: 'Add form level',
                babNum: 'Add bab num')),
          )
        ],
      );
    });
  }
}
