import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/user/register_screen.dart';
import '../view.dart';
import '../login/login_viewmodel.dart';
import '../login/login_screen.dart';

class HomeScreenUnsignedIn extends StatelessWidget {
  void _openLoginScreen(context) async {
    final result = await Navigator.push(context, LoginScreen.route());
    if (result != null) {}
  }

  void _openRegisterScreen(context) async {
    final result = await Navigator.push(context, RegisterScreen.route());
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
                  fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    )),
            Image.asset('assets/Votion.gif'),
            const SizedBox(height: 10),
            SizedBox(
              height: 30,
              child: View<LoginViewmodel>(
                builder: (_, vm, __) => FloatingActionButton.extended(
                  heroTag: "btn1",
                  label: Text('Get Started',
                      style: TextStyle(color: Colors.indigo[800])),
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.indigo[800]),
                  backgroundColor: Colors.white,
                  onPressed: () => _openLoginScreen(context),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              child: FloatingActionButton.extended(
                  heroTag: "btn2",
                  label: Text('Create Account',
                      style: TextStyle(color: Colors.indigo[800])),
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.indigo[800]),
                  backgroundColor: Colors.white,
                  onPressed: () => _openRegisterScreen(context)),
            ),
          ],
        ),
      ),
    );
  }
}
