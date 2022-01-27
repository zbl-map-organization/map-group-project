import 'dart:math';

import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/ui_utils.dart';

import '../../models/number.dart';
import '../view.dart';
import 'home_viewmodel.dart';

class HomeFloat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final a = Random();
    return View<HomeViewmodel>(
      shouldRebuild: false,
      builder: (context, vm, __) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed: vm.signOut,
            tooltip: 'Sign out',
            label: Text('Sign out'),
            icon: Icon(Icons.logout),
            heroTag: null,
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => showSnackBarWhenError(
                context, () => vm.addNumber(Number(value: a.nextInt(200)))),
            tooltip: 'Increment',
            child: Icon(Icons.add),
            heroTag: null,
          ),
        ],
      ),
    );
  }
}
