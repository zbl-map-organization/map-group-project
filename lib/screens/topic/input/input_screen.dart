import 'package:flutter/material.dart';
import '../../home/home_drawer.dart';
import '../../view.dart';
import '../topic_viewmodel.dart';
import 'add_topic_body.dart';
import 'input_app_bar.dart';
import 'input_body.dart';

// ignore: must_be_immutable
class InputScreen extends StatefulWidget {
  final String text;
  bool editbool = true;
  bool addbool = false;
  final int index;

  InputScreen(this.index, this.text) {
    if (text == 'View') {
      editbool = false;
    } else if (text == 'Add') {
      addbool = true;
    }
  }

  static Route route({index, text}) =>
      MaterialPageRoute(builder: (context) => InputScreen(index, text));

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return View<TopicViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
        appBar: InputAppBar(widget.text),
        drawer: HomeDrawer(),
        body: widget.addbool
            ? AddTopicBody()
            : InputBody(widget.index, widget.editbool, widget.addbool),
      );
    });
  }
}
