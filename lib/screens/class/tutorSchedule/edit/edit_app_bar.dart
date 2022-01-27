import 'package:flutter/material.dart';

class EditAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  EditAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(' $text Class'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
