import 'package:setup_mvvm/screens/schedule/schedule_app_bar.dart';

import '../home/home_drawer.dart';
import 'package:flutter/material.dart';


class ScheduleScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => ScheduleScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScheduleAppBar(),
      drawer: HomeDrawer(),
      
    );
  }
}
