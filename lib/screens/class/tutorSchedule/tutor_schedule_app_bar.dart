import 'package:flutter/material.dart';

class TutorScheduleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Schedule List'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
