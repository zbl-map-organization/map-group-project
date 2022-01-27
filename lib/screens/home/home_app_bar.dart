import 'package:flutter/material.dart';
import 'home_viewmodel.dart';

import '../view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SelectorView<HomeViewmodel, int>(
          showProgressIndicator: false,
          // progressBuilder: (_, __, ___) => LinearProgressIndicator(),
          selector: (_, vm) => vm.dataCount,
          builder: (_, vm, __, ___) =>
              Text('Home')),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
