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
      backgroundColor: Colors.indigo[800],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome To',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto')),
            Image.asset('assets/Votion.gif'),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: View<LoginViewmodel>(
                builder: (_, vm, __) => FloatingActionButton.extended(
                  label: Text('Get Started',
                      style: TextStyle(color: Colors.indigo[800])),
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.indigo[800]),
                  backgroundColor: Colors.white,
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
