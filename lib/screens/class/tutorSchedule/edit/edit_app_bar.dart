import 'package:flutter/material.dart';

class EditAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  EditAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(' $text Class'),
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