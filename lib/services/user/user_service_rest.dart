// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of each method of this service class.

import 'package:setup_mvvm/models/user.dart';

import '../../app/service_locator.dart';
import '../rest.dart';
import 'user_service.dart';
import '../../models/topic.dart';

/// `NoteServiceRest` is a datbase service for notes that are accessed from a REST service.
///
class UserServiceRest extends UserService {
  RestService get rest => locator();

  @override
  Future<List<User>> fetchUsers() async {
    final jsonList = await rest.get('topics');
    return (jsonList as List).map((json) => User.fromJson(json)).toList();
  }

  @override
  Future<User> getUser(id) async {
    final json = await rest.get('users/$id');
    return User.fromJson(json);
  }

  @override
  Future<User> updateUser({id, User data}) async {
    final json = await rest.patch('users/$id', data: data);
    return User.fromJson(json);
  }

  @override
  Future<void> removeUser(id) async {
    await rest.delete('users/$id');
  }

  @override
  Future<User> addUser(User data) async {
    final json = await rest.post('users', data: data);
    return User.fromJson(json);
  }
}
