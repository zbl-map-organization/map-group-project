// @dart=2.9

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'topic_service.dart';
import '../../models/topic.dart';

class TopicServiceLocal extends TopicService {
  List<Topic> _cachedDb;

  Future<List<Topic>> _readLocalToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String rawData = prefs.getString('topics');
    if (rawData == null) {
      _cachedDb = [];
    } else {
      final jsonList = jsonDecode(rawData);
      _cachedDb =
          (jsonList as List).map((json) => Topic.fromJson(json)).toList();
    }
    return [..._cachedDb];
  }

  Future<void> _writeCacheToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('users', jsonEncode(_cachedDb));
  }

  @override
  Future<List<Topic>> fetchTopics() async {
    try {
      return await _readLocalToCache();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Topic> getTopic(id) async {
    Topic _topic = _cachedDb.firstWhere((n) => n.id == id, orElse: null);
    if (_topic == null) return null;
    return Topic.copy(_topic);
  }

  @override
  Future<Topic> updateTopic({id, Topic data}) async {
    final index = _cachedDb.indexWhere((_topic) => _topic.id == id);
    if (index == -1) return null;
    _cachedDb[index] = data.copyWith(id: id);
    _writeCacheToLocal();

    return Topic.copy(_cachedDb[index]);
  }

  @override
  Future<void> removeTopic(id) async {
    _cachedDb.removeWhere((_topic) => _topic.id == id);
    _writeCacheToLocal();
  }

  @override
  Future<Topic> addTopic(Topic data) async {
    final id =
        (_cachedDb != null && _cachedDb.length > 0) ? _cachedDb.last.id + 1 : 1;
    final Topic _topic = data.copyWith(id: id);
    _cachedDb.add(_topic);
    _writeCacheToLocal();
    return Topic.copy(_topic);
  }
}
