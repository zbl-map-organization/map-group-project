import 'package:flutter/material.dart';

class TopicAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Topic List'),
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
