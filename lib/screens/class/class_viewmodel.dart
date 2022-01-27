// Turn of null-safety by writing the following line
// @dart=2.9

import 'package:flutter/material.dart';
import 'package:setup_mvvm/services/user/user_repository.dart';
import '../../app/service_locator.dart';
import '../../models/class.dart';
import '../../models/user.dart';
import '../../services/class/class_service.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';

class ClassViewmodel extends Viewmodel {
  final _service = locator<ClassService>();
  List<Class> _list;
  List<Class> get list => _list;
  Class getClass(int index) => _list == null ? null : _list[index];
  int get dataCount => _list == null ? 0 : _list.length;

  UserService get dataService => locator<UserService>();
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;
  List<User> _ulist;
  User getUser(id) {
    int i = _ulist.indexWhere((user) => user.uid == id);
    return _ulist[i];
  }

  init() => update(() async {
        _list = await _service.fetchClasses();
        _ulist = await dataService.fetchUsers();
        super.init();
      });

  void navigate({context, index, text}) async {
    await Navigator.pushNamed(context, '/editScreen',
        arguments: {'index': index, 'text': text});
  }

  void addClass(Class _class) => update(() async {
        final item = await _service.addClass(_class);
        _list.add(item);
      });
  void deleteClass(dynamic id) => update(() async {
        await _service.removeClass(id);
        _list.removeWhere((_class) => _class.id == id);
      });
  void updateClass({dynamic id, Class data}) => update(() async {
        print('Update Class $id');
        final item = await _service.updateClass(id: id, data: data);
        final index = _list.indexWhere((_class) => _class.id == id);
        if (index == -1) return;
        _list[index] = item;
      });
}
