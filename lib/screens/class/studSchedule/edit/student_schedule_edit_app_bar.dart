import 'package:flutter/material.dart';

class StudentScheduleEditAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  StudentScheduleEditAppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('View Schedule'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
