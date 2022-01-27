// @dart=2.9

//? Author: jumail@utm.my
//? Date: 8 Jan 2022

class User {
  String _username;
  String _password;
  final dynamic _uid;
  final String _token;
  String _name;
  String _email;
  String _phone;
  String _userType;
  get username => _username;
  set username(value) => _username = value;
  get password => _password;
  set password(value) => _password = value;
  get uid => _uid;
  get token => _token;
  get name => _name;
  set name(value) => _name = value;
  get email => _email;
  set email(value) => _email = value;
  get phone => _phone;
  set phone(value) => _phone = value;
  get userType => _userType;
  set userType(value) => _userType = value;

  User({username, password, uid, token, name, email, phone, userType})
      : _username = username,
        _password = password,
        _uid = uid,
        _token = token,
        _name = name,
        _email = email,
        _phone = phone,
        _userType = userType;
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

  User copyWith(
          {username, password, uid, token, name, email, phone, userType}) =>
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
