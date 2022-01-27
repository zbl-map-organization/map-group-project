import 'dart:async';

import '../../app/service_locator.dart';
import '../../services/user/user_service.dart';
import 'package:flutter/widgets.dart';

import '../../models/user.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class UserViewmodel extends Viewmodel {
  UserViewmodel();
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;
  UserService get dataService => locator<UserService>();
  final UserRepository _userRepository = locator();
  User getUser() => _userRepository.user;

  @override
  init() => update(() async {
        super.init();
      });

  void navigate({context, text}) async {
    await Navigator.pushNamed(context, '/userinputScreen',
        arguments: {'text': text});
  }

  Future<void> addUser(User user) async {
    turnBusy();
    await dataService.addUser(user);
    turnIdle();
  }

  Future<void> removeUser(dynamic id) async {
    turnBusy();
    await dataService.removeUser(id);
    turnIdle();
  }

  Future<void> updateUser(User user) async {
    turnBusy();
    final updateUser = await dataService.updateUser(data: user);
    user = updateUser;
    turnIdle();
  }

  Future<String> authAddUser(
      {@required String email, @required String password}) async {
    _streamObserver?.cancel();
    _streamObserver = null;
    String uid =
        await _userRepository.addUser(email: email, password: password);
    return uid;
  }
}
