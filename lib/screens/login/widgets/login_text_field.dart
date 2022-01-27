import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isObsecure;
  final IconButton button;
  final Function(String) onChanged;

  const LoginTextField(
      {this.controller,
      this.hint,
      this.icon,
      this.isObsecure = false,
      this.button,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Color.fromARGB(211, 255, 255, 255),
            borderRadius: BorderRadius.circular(25)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.indigo[600]),
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon) : null,
            suffixIcon: button,
          ),
          obscureText: isObsecure,
          onChanged: onChanged,
        ));
  }
}
