// Turn of null-safety by writing the following line
// @dart=2.9
import 'dart:async';
import '../../app/service_locator.dart';
import '../user/user_repository.dart';
import '../../models/user.dart';
import '../../models/class.dart';

abstract class ClassService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<Class>> fetchClasses();
  Future<Class> getClass(id);
  Future<Class> updateClass({id, Class data});
  Future<void> removeClass(id);
  Future<Class> addClass(Class data);

  // this getter is to be overidden, if the service supports stream such as firestore
  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
