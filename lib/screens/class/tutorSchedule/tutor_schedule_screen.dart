import '../../home/home_drawer.dart';
import 'package:flutter/material.dart';
import 'tutor_schedule_float.dart';

import 'tutor_schedule_app_bar.dart';
import 'tutor_schedule_body.dart';

class TutorScheduleScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TutorScheduleScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TutorScheduleAppBar(),
      drawer: HomeDrawer(),
      body: TutorScheduleBody(),
      floatingActionButton: TutorScheduleFloat(),
    );
  }
}
