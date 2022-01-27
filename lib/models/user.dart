// @dart=2.9

//? Author: jumail@utm.my
//? Date: 8 Jan 2022

class User {
  final String username;
  final String password;
  final dynamic uid;
  final String token;
  final String name;
  final String email;
  final String phone;
  final String userType;

  const User(
      {this.username = '',
      this.password = '',
      this.uid = '',
      this.token = '',
      this.name = '',
      this.email = '',
      this.phone,
      this.userType});
  User.copy(User from)
      : this(
            username: from.username,
            password: from.password,
            uid: from.uid,
            token: from.token,
            name: from.name,
            email: from.email,
            phone: from.phone,
            userType: from.userType);

  User.fromJson(Map<String, dynamic> json)
      : this(
            username: json['username'],
            password: json['password'],
            uid: json['uid'],
            token: json['token'],
            name: json['name'],
            email: json['email'],
            phone: json['phone'],
            userType: json['userType']);

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'uid': uid,
        'token': token,
        'name': name,
        'email': email,
        'phone': phone,
        'userType': userType
      };

  copyWith({username, password, uid, token, name, email, phone, userType}) =>
      User(
          username: username ?? this.username,
          password: password ?? this.password,
          uid: uid ?? this.uid,
          token: token ?? this.token,
          name: name ?? this.name,
          email: email ?? this.email,
          phone: phone ?? this.phone,
          userType: userType ?? this.userType);
}
