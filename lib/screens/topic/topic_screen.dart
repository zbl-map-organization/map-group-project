import 'package:flutter/material.dart';
import '../../screens/topic/topic_drawer.dart';
import '../topic/topic_viewmodel.dart';
import '../view.dart';
import 'topic_app_bar.dart';
import 'topic_body.dart';
import 'topic_float.dart';

class TopicScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TopicScreen());

  @override
  TopicScreenState createState() => TopicScreenState();
}

class TopicScreenState extends State<TopicScreen> {
  Widget build(BuildContext context) {
    return View<TopicViewmodel>(builder: (_, vm, __) {
      return Scaffold(
          appBar: TopicAppBar(),
          drawer: TopicDrawer(),
          body: TopicBody(),
          floatingActionButton: TopicFloat());
    });
  }
}
