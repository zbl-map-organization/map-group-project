import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/class/studSchedule/studSchedule_screen.dart';
import 'package:setup_mvvm/screens/class/tutorSchedule/tutor_schedule_screen.dart';
import 'package:setup_mvvm/screens/home/home_viewmodel.dart';
import '../../screens/user/user_input_screen.dart';
import '../../screens/class/class_screen.dart';
import '../../screens/topic/topic_screen.dart';
import '../view.dart';
import 'home_screen.dart';

class HomeDrawer extends StatelessWidget {
  void _openTopicScreen(context) async {
    final result = await Navigator.push(context, TopicScreen.route());
    if (result != null) {}
  }

  void _openClassScreen(context) async {
    final result = await Navigator.push(context, ClassScreen.route());
    if (result != null) {}
  }

  void _openUserScreen(BuildContext context, text) async {
    final result =
        await Navigator.push(context, UserInputScreen.route(text: text));
    if (result != null) {}
  }

  void _openHomeScreen(BuildContext context) async {
    final result = await Navigator.push(context, HomeScreen.route());
    if (result != null) {}
  }

  void _openStudScheduleScreen(BuildContext context) async {
    final result = await Navigator.push(context, StudScheduleScreen.route());
    if (result != null) {}
  }

  void _openTutorScheduleScreen(BuildContext context) async {
    final result = await Navigator.push(context, TutorScheduleScreen.route());
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
        builder: (_, vm, __) => Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                    ),
                    currentAccountPicture: Image.asset("assets/avatar1.png",),
                    accountEmail: Text(''),
                    accountName: Text(
                      '',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.indigo),
                    title: Text('Home'),
                    onTap: () => _openHomeScreen(context),
                  ),
                  ListTile(
                    leading: Icon(Icons.menu_book, color: Colors.indigo),
                    title: Text('Topics'),
                    onTap: () => _openTopicScreen(context),
                  ),
                  ListTile(
                    leading: Icon(Icons.school_outlined, color: Colors.indigo),
                    title: Text('Classes'),
                    onTap: () => _openClassScreen(context),
                  ),
                  ListTile(
                    leading: Icon(Icons.event_available_outlined,
                        color: Colors.indigo),
                    title: Text('My Schedule'),
                    onTap: () => ((vm.getUser(vm.user.uid).userType) == "V")
                        ? _openTutorScheduleScreen(context)
                        : _openStudScheduleScreen(context),
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.indigo),
                    title: Text('Profile'),
                    onTap: () {
                      _openUserScreen(context, 'View');
                    },
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 200),
                      // This align moves the children to the bottom
                      child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          // This container holds all the children that will be aligned
                          // on the bottom and should not scroll with the above ListView
                          child: Container(
                              child: Column(
                            children: <Widget>[
                              Divider(),
                              ListTile(
                                  tileColor: Colors.red[400],
                                  leading: Icon(Icons.logout),
                                  title: Text('Sign Out'),
                                  onTap: () {
                                    Navigator.of(context)
                                        .popUntil((route) => route.isFirst);
                                    vm.signOut();
                                  }),
                            ],
                          ))))
                ],
              ),
            ));
  }
}
