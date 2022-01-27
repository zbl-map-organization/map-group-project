import 'package:flutter/material.dart';

import '../view.dart';

class ScheduleAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
      Text('Schedule'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
