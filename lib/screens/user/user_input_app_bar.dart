import 'package:flutter/material.dart';

class UserInputAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  UserInputAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(' $text Profile'),
    
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
