import 'package:flutter/material.dart';

class StudentScheduleEditAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  StudentScheduleEditAppBar();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('View Schedule'),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.blue.shade200,
          child: IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            onPressed: () => {},
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
