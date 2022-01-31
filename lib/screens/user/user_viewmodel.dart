import 'dart:async';
import '../../app/service_locator.dart';
import '../../services/user/user_service.dart';
import 'package:flutter/widgets.dart';
import '../../models/user.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class UserViewmodel extends Viewmodel {
  List<User> _list;
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  UserService get dataService => locator<UserService>();
  final UserRepository _userRepository = locator();
  User get user {
    print(_userRepository.user.phone);
    return _userRepository.user;
  }

  User getUser(id) {
    int i = _list.indexWhere((user) => user.uid == id);
    return _list[i];
  }

  @override
  init() => update(() async {
        _list = await dataService.fetchUsers();
        super.init();
      });

  void navigate({context, text}) async {
    await Navigator.pushNamed(context, '/userinputScreen',
        arguments: {'text': text});
  }

  Future<void> addUser(User user) async {
    turnBusy();
    await dataService.addUser(user);
    _list.add(user);
    print('${user.email}${user.name}${user.phone}');
    turnIdle();
  }

  Future<void> removeUser(uid) async {
    turnBusy();
    await dataService.removeUser(uid);
    _list.removeWhere((user) => user.uid == uid);
    turnIdle();
  }

  Future<void> updateUser({dynamic id, User data}) async {
    turnBusy();
    final updateUser = await dataService.updateUser(data: data);
    final index = _list.indexWhere((user) => user.uid == id);
    if (index == -1) return;
    _list[index] = updateUser;
    turnIdle();
  }

  Future<String> authAddUser(
      {@required String email, @required String password}) async {
    String uid =
        await _userRepository.addUser(email: email, password: password);
    return uid;
  }

  Future<void> signIn(
      {@required String username, @required String password}) async {
    await _userRepository.signIn(email: username, password: password);
  }

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    await _userRepository.signOut();
  }
}
