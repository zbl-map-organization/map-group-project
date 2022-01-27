import 'package:setup_mvvm/screens/class/studSchedule/studSchedule_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/class/studSchedule/studSchedule_body.dart';
import 'package:setup_mvvm/screens/home/home_drawer.dart';
import '../../view.dart';
import '../class_viewmodel.dart';

class StudScheduleScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => StudScheduleScreen());

  @override
  Widget build(BuildContext context) {
    return View<ClassViewmodel>(builder: (_, vm, __) {
      return Scaffold(
        appBar: StudScheduleAppBar(),
        drawer: HomeDrawer(),
        body: StudScheduleBody(),
      );
    });
  }
}
