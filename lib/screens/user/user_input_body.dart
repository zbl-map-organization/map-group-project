import '../../screens/user/user_input_screen.dart';

import '../../models/user.dart';

import '../view.dart';
import 'package:flutter/material.dart';

import 'user_viewmodel.dart';

class InputBody extends StatelessWidget {
  void _openInputScreen(context, index, text) async {
    final result = await Navigator.push(
        context, UserInputScreen.route(index: index, text: text));
    if (result != null) {}
  }

  final dynamic index;
  final bool editbool;
  InputBody(this.index, this.editbool);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Center(
        child: SelectorView<UserViewmodel, User>(
      selector: (_, vm) => vm.getUser(),
      builder: (_, vm, user, __) {
        return Column(children: [
          Container(
            padding: EdgeInsets.all(25.0),
            color: Colors.transparent,
            child: new Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: new Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              initialValue: vm.getUser().username,
              enabled: editbool,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Username',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type the userid here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: value,
                    password: user.password,
                    uid: user.uid,
                    name: user.name,
                    email: user.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              maxLines: 4,
              initialValue: vm.getUser().email,
              enabled: editbool,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type the name here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    password: user.password,
                    uid: user.uid,
                    name: user.name,
                    email: value),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              maxLines: 2,
              initialValue: vm.getUser().name,
              enabled: editbool,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type the photourl here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    password: user.password,
                    uid: user.uid,
                    name: value,
                    email: user.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              // keyboardType: TextInputType.number,
              initialValue: vm.getUser().name,
              enabled: editbool,
              decoration: InputDecoration(
                icon: Icon(Icons.mail),
                labelText: 'Login',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type the login here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    password: user.password,
                    uid: user.uid,
                    name: value,
                    email: user.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              // keyboardType: TextInputType.number,
              initialValue: vm.getUser().email,
              enabled: editbool,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                labelText: 'Password',
                hintText: 'Type the passworde here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    password: user.password,
                    uid: user.uid,
                    name: user.name,
                    email: value),
              ),
            ),
          ),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text("Edit".toUpperCase(),
                      style: TextStyle(fontSize: 12)),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(110.0),
                              side: BorderSide(color: Colors.blue)))),
                  onPressed: () => _openInputScreen(context, index, 'Edit'),
                )
              ],
            ),
            visible: !editbool,
          ),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Save".toUpperCase(),
                        style: TextStyle(fontSize: 12)),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(110.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () => _openInputScreen(context, index, 'View')),
              ],
            ),
            visible: editbool,
          ),
        ]);
      },
    )));
  }
}
