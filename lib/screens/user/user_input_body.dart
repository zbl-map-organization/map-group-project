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
    return Center(
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
                // icon: Icon(Icons.person),
                labelText: 'UserID',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type your UserID here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: value,
                    name: user.name,
                    userType: user.userType,
                    phone: user.phone,
                    email: user.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              initialValue: vm.getUser().name,
              enabled: editbool,
              decoration: InputDecoration(
                // icon: Icon(Icons.person),
                labelText: 'Name',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type your name here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    name: value,
                    userType: user.userType,
                    phone: user.phone,
                    email: user.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              initialValue: vm.getUser().userType,
              enabled: editbool,
              decoration: InputDecoration(
                // icon: Icon(Icons.person),
                labelText: 'UserType',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type your User Type here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    name: user.name,
                    userType: value,
                    phone: user.phone,
                    email: user.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextFormField(
              // keyboardType: TextInputType.number,
              initialValue: vm.getUser().phone,
              enabled: editbool,
              decoration: InputDecoration(
                // icon: Icon(Icons.phone),
                labelText: 'Telephone No.',
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                hintText: 'Type your phone number here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    name: user.name,
                    userType: user.userType,
                    phone: value,
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
                // icon: Icon(Icons.mail),
                labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontFamily: 'AvenirLight'),
                labelText: 'Email Address',
                hintText: 'Type your email address here',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => vm.updateUser(
                User(
                    username: user.username,
                    name: user.name,
                    userType: user.userType,
                    phone: user.phone,
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
    ));
  }
}
