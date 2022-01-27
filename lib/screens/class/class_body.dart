import 'class_viewmodel.dart';
import '../../screens/view.dart';
import 'package:flutter/material.dart';
import 'class_tile.dart';

class ClassBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SelectorView<ClassViewmodel, int>(
      selector: (_, vm) => vm.dataCount,
      builder: (_, vm, __, ___) {
        return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          itemCount: vm.dataCount,
          separatorBuilder: (context, index) => Divider(
            color: Colors.white,
          ),
          itemBuilder: (context, index) => ClassTile(index),
        );
      },
    ));
  }
}
