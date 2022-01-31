import '../../view.dart';
import 'package:flutter/material.dart';
import '../class_viewmodel.dart';
import 'studSchedule_tile.dart';

class StudScheduleBody extends StatelessWidget {
  StudScheduleBody();
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
            height: 0,
            thickness: 0,
            color: Colors.white,
          ),
          itemBuilder: (context, index) => StudScheduleTile(index),
        );
      },
    ));
  }
}
