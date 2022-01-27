// @dart=2.9

import 'dart:async';

import '../../app/service_locator.dart';
import '../user/user_repository.dart';
import '../../models/user.dart';
import '../../models/number.dart';

abstract class NumberService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<Number>> fetchNumbers();
  Future<Number> getNumber(id);
  Future<Number> updateNumber({id, Number data});
  Future<void> deleteNumber(id);
  Future<Number> addNumber(Number data);

  // this getter is to be overidden, if the service supports stream such as firestore
  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
