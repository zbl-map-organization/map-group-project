import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_viewmodel.dart';
import '../../screens/user/user_input_screen.dart';
import '../../screens/class/class_screen.dart';
import '../../screens/topic/topic_screen.dart';

class HomeDrawer extends StatelessWidget {
  HomeViewmodel _vm;
  HomeDrawer(vm) : _vm = vm;
  void _openTopicScreen(context) async {
    final result = await Navigator.push(context, TopicScreen.route());
    if (result != null) {}
  }

  void _openClassScreen(context) async {
    final result = await Navigator.push(context, ClassScreen.route());
    if (result != null) {}
  }

  void _openUserScreen(BuildContext context, index, text) async {
    final result = await Navigator.push(
        context, UserInputScreen.route(index: index, text: text));
    if (result != null) {}
  }

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
          ListTile(
            title: Text('Classes'),
            onTap: () => _openClassScreen(context),
          ),
          ListTile(
            title: Text('My Schedule'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () => _openUserScreen(context, _vm.user.uid, 'View'),
          ),
        ],
      ),
    );
  }
}
