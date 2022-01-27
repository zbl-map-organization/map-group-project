import 'package:flutter/material.dart';

class UserInputAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  UserInputAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(' $text Topic'),
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
