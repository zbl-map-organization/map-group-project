import 'package:flutter/material.dart';

class TutorScheduleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Schedule List'),
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
