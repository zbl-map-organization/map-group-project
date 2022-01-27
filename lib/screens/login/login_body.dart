// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/login/login_text_fields.dart';
import '../view.dart';
import 'login_buttons.dart';
import 'login_screen.dart';
import 'login_viewmodel.dart';

class LoginBody extends StatelessWidget {
  final LoginScreenState _state;

  LoginBody(this._state);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: View<LoginViewmodel>(
      builder: (context, viewmodel, _) => Column(
      
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          SizedBox(
            height: 200,
          child:
          Image.asset('assets/Votion_login.gif')),
          const SizedBox(height: 10),
          ...buildLoginTextFields(_state),
          if (viewmodel.errorMessage != null)
            Text(
              viewmodel.errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
            const SizedBox(height: 10),
          LoginButtons(viewmodel: viewmodel, state: _state),
        ],
      ),
    ));
  }
}
