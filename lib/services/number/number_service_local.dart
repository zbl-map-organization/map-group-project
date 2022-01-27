// @dart=2.9

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'number_service.dart';
import '../../models/number.dart';

class NumberServiceLocal extends NumberService {
  List<Number> _cachedDb;

  Future<List<Number>> _readLocalToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rawData = prefs.getString('numbers');
    if (rawData == null) {
      _cachedDb = [];
    } else {
      final jsonList = jsonDecode(rawData);
      _cachedDb =
          (jsonList as List).map((json) => Number.fromJson(json)).toList();
    }
    return [..._cachedDb];
  }

  Future<void> _writeCacheToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('numbers', jsonEncode(_cachedDb));
  }

  @override
  Future<List<Number>> fetchNumbers() async {
    try {
      return await _readLocalToCache();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Number> getNumber(id) async {
    Number number = _cachedDb.firstWhere((n) => n.id == id, orElse: null);
    if (number == null) return null;
    return Number.copy(number);
  }

  @override
  Future<Number> updateNumber({id, Number data}) async {
    final index = _cachedDb.indexWhere((number) => number.id == id);
    if (index == -1) return null;
    _cachedDb[index] = data.copyWith(id: id);
    _writeCacheToLocal();

    return Number.copy(_cachedDb[index]);
  }

  @override
  Future<void> deleteNumber(id) async {
    _cachedDb.removeWhere((number) => number.id == id);
    _writeCacheToLocal();
  }

  @override
  Future<Number> addNumber(Number data) async {
    final id =
        (_cachedDb != null && _cachedDb.length > 0) ? _cachedDb.last.id + 1 : 1;
    final Number number = data.copyWith(id: id);
    _cachedDb.add(number);
    _writeCacheToLocal();
    return Number.copy(number);
  }
}
