import 'package:flutter/material.dart';
import '../home/home_drawer.dart';
import 'topic_app_bar.dart';
import 'topic_body.dart';
import 'topic_float.dart';

class TopicScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TopicScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopicAppBar(),
        drawer: HomeDrawer(),
        body: TopicBody(),
        floatingActionButton: TopicFloat());
  }
}
