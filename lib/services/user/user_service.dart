// Turn of null-safety by writing the following line
// @dart=2.9

import 'dart:async';

import '../../services/user/user_repository.dart';

import '../../app/service_locator.dart';

import '../../models/user.dart';

//? The abstract class for the service is fully given. Do nothing here.

/// This abstract class is meant to facilitate the concept of Dependency Inversion.
/// That means, you can simply switch between services (i.e., from REST to Mock and vice-versa)
/// without changing most parts of your code.
/// You simply switch the service in service locator registration (service_locator.dart)
///
abstract class UserService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<User>> fetchUsers();
  Future<User> getUser();
  Future<User> updateUser({User data});
  Future<void> removeUser(uid);
  Future<User> addUser(User data);

  // this getter is to be overidden, if the service supports stream such as firestore
  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
