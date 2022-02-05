// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:setup_mvvm/models/user.dart';
import '../../app/service_locator.dart';
import '../rest.dart';
import 'user_service.dart';

/// `NoteServiceRest` is a datbase service for notes that are accessed from a REST service.
///
class UserServiceRest extends UserService {
  RestService get rest => locator();
  String get _userId => user.uid;

  @override
  Future<List<User>> fetchUsers() async {
    final jsonList = await rest.get('topics');
    return (jsonList as List).map((json) => User.fromJson(json)).toList();
  }

  @override
  Future<User> getUser() async {
    final json = await rest.get('users/$_userId');
    return User.fromJson(json);
  }

  @override
  Future<User> updateUser({id, User data}) async {
    final json = await rest.patch('users/$id', data: data);
    return User.fromJson(json);
  }

  @override
  Future<void> removeUser(uid) async {
    await rest.delete('users/$_userId');
  }

  @override
  Future<User> addUser(User data) async {
    final json = await rest.post('users', data: data);
    return User.fromJson(json);
  }
}
