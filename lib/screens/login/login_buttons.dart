import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'login_viewmodel.dart';

// This class is only for refactoring purposes.
// To declutter a bit the login_body.dart

class LoginButtons extends StatelessWidget {
  final LoginViewmodel viewmodel;
  final LoginScreenState state;
  const LoginButtons({this.viewmodel, this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(90, 50),
              primary: Color.fromARGB(255, 15, 22, 63)),
          child: Text('Sign in'),
          onPressed: () => state.onLogin(viewmodel),
        ),
        const SizedBox(width: 10.0),
        const SizedBox(width: 10.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(90, 50),
              primary: Color.fromARGB(255, 54, 57, 75)),
          child: Text('Clear'),
          onPressed: () => state.onClear(viewmodel),
        ),
      ],
    );
  }
}
