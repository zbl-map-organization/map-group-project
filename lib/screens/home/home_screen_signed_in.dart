import 'package:flutter/material.dart';
import 'home_app_bar.dart';
import 'home_body.dart';
import 'home_drawer.dart';

class HomeScreenSignedIn extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      drawer: HomeDrawer(),
      body: HomeBody(),
    );
  }
}
