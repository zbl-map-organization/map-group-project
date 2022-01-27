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
    return Stack( // <-- STACK AS THE SCAFFOLD PARENT
      children: [
       
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/login.png"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
       
          Scaffold(
            backgroundColor: Colors.transparent, // <-- SCAFFOLD WITH TRANSPARENT BG
                  
    body: View<LoginViewmodel>(
      builder: (context, viewmodel, _) => Column(
      
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
         
        children: [
          SizedBox(height: 100,),
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
    ))]);
  }
}

/*SizedBox(
            height: 200,
          child:
          Image.asset('assets/Votion_login.gif')),
          const SizedBox(height: 10),
          */