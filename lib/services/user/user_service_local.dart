// @dart=2.9

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_service.dart';
import '../../models/user.dart';

class UserServiceLocal extends UserService {
  List<User> _cachedDb;

  Future<List<User>> _readLocalToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rawData = prefs.getString('users');
    if (rawData == null) {
      _cachedDb = [];
    } else {
      final jsonList = jsonDecode(rawData);
      _cachedDb =
          (jsonList as List).map((json) => User.fromJson(json)).toList();
    }
    return [..._cachedDb];
  }

  Future<void> _writeCacheToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('users', jsonEncode(_cachedDb));
  }

  @override
  Future<List<User>> fetchUsers() async {
    try {
      return await _readLocalToCache();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User> getUser(id) async {
    User _user = _cachedDb.firstWhere((n) => n.uid == id, orElse: null);
    if (_user == null) return null;
    return User.copy(_user);
  }

  @override
  Future<User> updateUser({id, User data}) async {
    final index = _cachedDb.indexWhere((_user) => _user.uid == id);
    if (index == -1) return null;
    _cachedDb[index] = data.copyWith(uid: id);
    _writeCacheToLocal();

    return User.copy(_cachedDb[index]);
  }

  @override
  Future<void> removeUser(id) async {
    _cachedDb.removeWhere((_user) => user.uid == id);
    _writeCacheToLocal();
  }

  @override
  Future<User> addUser(User data) async {
    final id = (_cachedDb != null && _cachedDb.length > 0)
        ? _cachedDb.last.uid + 1
        : 1;
    final User user = data.copyWith(uid: id);
    _cachedDb.add(user);
    _writeCacheToLocal();
    return User.copy(user);
  }
}
