import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_viewmodel.dart';

import 'home_app_bar.dart';
import 'home_body.dart';
import 'home_drawer.dart';
import 'home_float.dart';

class HomeScreenSignedIn extends StatelessWidget {
  HomeViewmodel _vm;
  HomeScreenSignedIn(vm) : _vm = vm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      drawer: HomeDrawer(_vm),
      body: HomeBody(),
      floatingActionButton: HomeFloat(),
    );
  }
}
