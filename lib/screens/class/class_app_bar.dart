import 'package:flutter/material.dart';

class ClassAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Class List'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
