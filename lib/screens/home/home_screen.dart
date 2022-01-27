import 'package:flutter/material.dart';

import 'home_screen_unsigned_in.dart';
import 'home_screen_signed_in.dart';
import '../view.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => HomeScreen());

  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? HomeScreenSignedIn(vm) : HomeScreenUnsignedIn());
  }
}
