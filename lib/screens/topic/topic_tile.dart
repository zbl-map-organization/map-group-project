import 'input/input_screen.dart';
import 'topic_viewmodel.dart';
import '../../models/topic.dart';
import 'package:flutter/material.dart';

import '../view.dart';

class TopicTile extends StatelessWidget {
  final int index;
  const TopicTile(this.index);
  void _openInputScreen(context, index, text) async {
    print('Here is the $index!!!!!');
    final result = await Navigator.push(
        context, InputScreen.route(index: index, text: text));
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<TopicViewmodel, Topic>(
      selector: (_, vm) => vm.getTopic(index),
      builder: (_, vm, topic, ___) {
        return ListTile(
          tileColor: Colors.blue[50],
          selectedTileColor: Colors.blue[100],
          title: Text('Form ${topic.formLvl} Chapter ${topic.babNum}'),
          subtitle: Text('${topic.title}'),
          onTap: () => _openInputScreen(context, index, 'View'),
        );
      },
    );
  }
}
