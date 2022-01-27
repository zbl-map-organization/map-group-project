// @dart=2.9

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'class_service.dart';
import '../../models/class.dart';

class ClassServiceLocal extends ClassService {
  List<Class> _cachedDb;

  Future<List<Class>> _readLocalToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rawData = prefs.getString('classes');
    if (rawData == null) {
      _cachedDb = [];
    } else {
      final jsonList = jsonDecode(rawData);
      _cachedDb =
          (jsonList as List).map((json) => Class.fromJson(json)).toList();
    }
    return [..._cachedDb];
  }

  Future<void> _writeCacheToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('classes', jsonEncode(_cachedDb));
  }

  @override
  Future<List<Class>> fetchClasses() async {
    try {
      return await _readLocalToCache();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Class> getClass(id) async {
    Class _class = _cachedDb.firstWhere((n) => n.id == id, orElse: null);
    if (_class == null) return null;
    return Class.copy(_class);
  }

  @override
  Future<Class> updateClass({id, Class data}) async {
    final index = _cachedDb.indexWhere((_class) => _class.id == id);
    if (index == -1) return null;
    _cachedDb[index] = data.copyWith(id: id);
    _writeCacheToLocal();

    return Class.copy(_cachedDb[index]);
  }

  @override
  Future<void> removeClass(id) async {
    _cachedDb.removeWhere((_class) => _class.id == id);
    _writeCacheToLocal();
  }

  @override
  Future<Class> addClass(Class data) async {
    final id =
        (_cachedDb != null && _cachedDb.length > 0) ? _cachedDb.last.id + 1 : 1;
    final Class _class = data.copyWith(id: id);
    _cachedDb.add(_class);
    _writeCacheToLocal();
    return Class.copy(_class);
  }
}
