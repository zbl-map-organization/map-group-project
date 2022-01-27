import '../home/home_drawer.dart';
import '../topic/topic_body.dart';
import '../topic/topic_screen.dart';
import 'package:flutter/material.dart';
import 'class_drawer.dart';
import 'class_float.dart';

import 'class_app_bar.dart';
import 'class_body.dart';

class ClassScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => ClassScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClassAppBar(),
      drawer: HomeDrawer(),
      body: ClassBody(),
      floatingActionButton: Float(),
    );
  }
}
