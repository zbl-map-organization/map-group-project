import 'package:setup_mvvm/models/user.dart';

import '../../screens/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import '../view.dart';

class RegisterScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());

  String username;
  String name;
  String email;
  String phone;
  String userType;

  @override
  Widget build(BuildContext context) {
    return View<UserViewmodel>(builder: (_, vm, ___) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Register'),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade200,
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  onPressed: () => {},
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
                child: View<UserViewmodel>(
                    builder: (_, vm, __) => Column(children: [
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                // icon: Icon(Icons.person),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontFamily: 'AvenirLight'),
                                hintText: 'Type your Username here',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) => username = value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                // icon: Icon(Icons.person),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontFamily: 'AvenirLight'),
                                hintText: 'Type your name here',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) => name = value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                // icon: Icon(Icons.person),
                                labelText: 'UserType',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontFamily: 'AvenirLight'),
                                hintText: 'Type your User Type here',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) => userType = value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: TextFormField(
                              // keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                // icon: Icon(Icons.phone),
                                labelText: 'Telephone No.',
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontFamily: 'AvenirLight'),
                                hintText: 'Type your phone number here',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) => phone = value,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: TextFormField(
                              // keyboardType: TextInputType.number,

                              decoration: InputDecoration(
                                // icon: Icon(Icons.mail),
                                labelStyle: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontFamily: 'AvenirLight'),
                                labelText: 'Email Address',
                                hintText: 'Type your email address here',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (value) => email = value,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  child: Text("Register".toUpperCase(),
                                      style: TextStyle(fontSize: 12)),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(110.0),
                                              side: BorderSide(
                                                  color: Colors.red)))),
                                  onPressed: () async {
                                    String uid = await vm.authAddUser(
                                        email: email, password: phone);
                                    await vm.addUser(User(
                                        uid: uid,
                                        username: username,
                                        name: name,
                                        userType: userType,
                                        phone: phone,
                                        email: email));

                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        ]))),
          ));
    });
  }
}
