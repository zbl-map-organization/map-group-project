import 'package:flutter/material.dart';
//import '../../screens/class/class_screen.dart';
import '../../screens/topic/topic_screen.dart';

class TopicDrawer extends StatelessWidget {
  void _openTopicScreen(context) async {
    final result = await Navigator.push(context, TopicScreen.route());
    if (result != null) {}
  }

  // void _openClassScreen(context) async {
  //   final result = await Navigator.push(context, ClassScreen.route());
  //   if (result != null) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('User Here'),
            decoration: BoxDecoration(
              color: Colors.indigo[800],
            ),
          ),
          ListTile(
            title: Text('Topics'),
            onTap: () => _openTopicScreen(context),
          ),
          // ListTile(
          //   title: Text('Classes'),
          //   onTap: () => _openClassScreen(context),
          // ),
          ListTile(
            title: Text('My Schedule'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
