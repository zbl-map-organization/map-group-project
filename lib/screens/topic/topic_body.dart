import 'topic_viewmodel.dart';
import '../../screens/view.dart';
import 'package:flutter/material.dart';
import 'topic_tile.dart';

class TopicBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SelectorView<TopicViewmodel, int>(
      selector: (_, vm) => vm.dataCount,
      builder: (_, vm, __, ___) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          itemCount: vm.dataCount,
          separatorBuilder: (context, index) => Divider(
            color: Colors.white,
          ),
          itemBuilder: (context, index) => TopicTile(index),
        );
      },
    ));
  }
}
