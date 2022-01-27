import 'input/input_screen.dart';
import 'topic_viewmodel.dart';
import '../../models/topic.dart';
import 'package:flutter/material.dart';

import '../view.dart';

class TopicTile extends StatelessWidget {
  final int index;
  const TopicTile(this.index);
  void _openInputScreen(context, index, text) async {
    final result = await Navigator.push(
        context, InputScreen.route(index: index, text: text));
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return SelectorView<TopicViewmodel, Topic>(
      selector: (_, vm) => vm.getTopic(index),
      builder: (_, vm, topic, ___) {
        return Padding(
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
                      Text('${topic.title}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800])),
                      Text('Form ${topic.formLvl}',
                          style: TextStyle(color: Colors.grey[800])),
                      Text('Chapter ${topic.babNum}',
                          style: TextStyle(color: Colors.indigo[400])),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Colors.blue,
                  onPressed: () => _openInputScreen(context, index, 'View'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
// ListTile(
//           trailing: Icon(Icons.note),
//           title: Text('Form ${topic.formLvl} Chapter ${topic.babNum}'),
//           subtitle: Text('${topic.title}'),
//           onTap: () => {_openInputScreen(context, index, 'View')},
//         );