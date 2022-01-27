import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:setup_mvvm/screens/class/studSchedule/studSchedule_screen.dart';
import 'package:setup_mvvm/screens/class/tutorSchedule/tutor_schedule_screen.dart';
import '../class/class_screen.dart';
import '../topic/topic_screen.dart';
import '../user/user_input_screen.dart';
import '../view.dart';
import 'home_viewmodel.dart';

var data = [
  {
    "title": "Topics",
    "color": 0xff2980b9,
    "image": "assets/book.png",
    "screen": "topic"
  },
  {
    "title": "Classes",
    "color": 0xff8e44ad,
    "image": "assets/class.png",
    "screen": "class"
  },
  {
    "title": "My Schedule",
    "color": 0xffc0392b,
    "image": "assets/schedule.png",
    "screen": "schedule"
  },
  {
    "title": "Profile",
    "color": 0xff27ae60,
    "image": "assets/people.gif",
    "screen": "profile"
  }
];

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var itemList = data;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

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

  void _openStudScheduleScreen(BuildContext context) async {
    final result = await Navigator.push(context, StudScheduleScreen.route());
    if (result != null) {}
  }

  void _openTutorScheduleScreen(BuildContext context) async {
    final result = await Navigator.push(context, TutorScheduleScreen.route());
    if (result != null) {}
  }

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
        builder: (_, vm, __) => Container(
                  child: SingleChildScrollView(
                child: Center(
                  child: Column(children: [
                    Image.asset('assets/Volunteer Tutoring2.gif'),
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset('assets/FEATURES.gif'),                    
                    Container(
                      height: 300,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: _scrollNotification,
                        child: ListView(
                          controller: listScrollController,
                          scrollDirection: Axis.horizontal,
                          children: data.map((item) {
                            return AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              transform: Matrix4.rotationZ(scrollDirection ==
                                      ScrollDirection.forward
                                  ? 0.07
                                  : scrollDirection == ScrollDirection.reverse
                                      ? -0.07
                                      : 0),
                              width: 200,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Color(item["color"]),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(item["color"])
                                            .withOpacity(0.6),
                                        offset: Offset(-6, 4),
                                        blurRadius: 10)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item["image"],
                                    height: 120,
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16)),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary:
                                            Color(item["color"]).withAlpha(150),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    child: (item['screen'] == "topic")
                                        ? Text('Topics')
                                        : (item['screen'] == "class")
                                            ? Text('Classes')
                                            : (item['screen'] == "schedule")
                                                ? Text('My Schedule')
                                                : Text('My Profile'),
                                    onPressed: () => (item['screen'] == "topic")
                                        ? _openTopicScreen(context)
                                        : (item['screen'] == "class")
                                            ? _openClassScreen(context)
                                            : (item['screen'] == "schedule")
                                                ? ((vm
                                                            .getUser(
                                                                vm.user.uid)
                                                            .userType) ==
                                                        "V")
                                                    ? _openTutorScheduleScreen(
                                                        context)
                                                    : _openStudScheduleScreen(
                                                        context)
                                                : _openUserScreen(
                                                    context, 'View'),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ]),
                ),
              )),
            );
  }
}
