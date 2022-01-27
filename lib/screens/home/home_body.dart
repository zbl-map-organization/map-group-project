// import 'dart:math';

import 'package:flutter/material.dart';

import '../view.dart';
import 'home_viewmodel.dart';
import 'number_list_tile.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<HomeViewmodel, int>(
        showProgressIndicator: false,
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___) => ListView.separated(
          itemCount: vm.dataCount,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, index) => NumberListTile(index),
        ),
      ),
    );
  }
}
