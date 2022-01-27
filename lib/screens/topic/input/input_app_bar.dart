import 'package:flutter/material.dart';

class InputAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  InputAppBar(this.text);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(' $text Topic'),
     
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
