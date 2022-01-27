import 'dart:math';
import 'package:flutter/material.dart';

import '../../models/number.dart';
import 'home_viewmodel.dart';
import '../view.dart';
import '../ui_utils.dart';

class NumberListTile extends StatelessWidget {
  final int _index;
  const NumberListTile(this._index);

  @override
  Widget build(BuildContext context) {
    final rnd = Random();

    return SelectorView<HomeViewmodel, Number>(
      showProgressIndicator: false,
      selector: (_, vm) => vm.getNumber(_index),
      builder: (context, vm, number, __) => ListTile(
        title: Text('${number.value}'),
        subtitle:
            Text('Tap to change number randomly and long pressed to delete'),
        // Delete an item on long press
        onLongPress: () => showSnackBarWhenError(
            context, () => vm.deleteNumber(vm.getNumber(_index).id)),

        // Update to a new random number on tap
        onTap: () => showSnackBarWhenError(
            context,
            () => vm.updateNumber(
                id: vm.getNumber(_index).id,
                data: Number(value: rnd.nextInt(200)))),
      ),
    );
  }
}
