import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Sign in'));
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
