import 'package:flutter/material.dart';

import '../view.dart';
import '../login/login_viewmodel.dart';
import '../login/login_screen.dart';

class HomeScreenUnsignedIn extends StatelessWidget {
  void _openLoginScreen(context) async {
    final result = await Navigator.push(context, LoginScreen.route());
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You are currently not signed in.'),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: View<LoginViewmodel>(
                builder: (_, vm, __) => FloatingActionButton.extended(
                  label: Text('Sign in'),
                  icon: Icon(Icons.login),
                  onPressed: () => _openLoginScreen(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
