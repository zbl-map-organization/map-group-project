// @dart=2.9

import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'topic_service.dart';
import '../../models/topic.dart';

class TopicServiceFirestore extends TopicService {
  // static const String _userId = 'hm2leHyBDdYoMxF8hyqceJrs9rF2';
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection => _firestore
      .collection('topics/GeneralTopic/items'); // use path style to reference
  // _firestore.collection('topics').doc('GeneralTopic').collection('items'); // alternative reference

  DocumentReference _getTopicDocument(topicId) => _firestore.document(
      'topics/GeneralTopic/items/$topicId'); // use path style to reference

  @override
  Stream get stream => _collection.snapshots();

  @override
  Future<List<Topic>> fetchTopics() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final _topic = Topic.fromJson(doc.data()).copyWith(
          id: doc
              .id); // transform data. Field id might be null, so take the doc id instead
      return _topic;
    }).toList();
  }

  @override
  Future<Topic> getTopic(id) async {
    final n = await _getTopicDocument(id).get();
    return Topic.fromJson(n.data());
  }

  @override
  Future<Topic> updateTopic({id, Topic data}) async {
    final update = data.copyWith(id: id);
    await _getTopicDocument(id).update(update.toJson());
    return update;
  }

  @override
  Future<void> removeTopic(id) async {
    await _getTopicDocument(id).delete();
  }

  @override
  Future<Topic> addTopic(Topic data) async {
    final _id = _idGenerator.v1(); // Generate time-based id
    final _data = data.copyWith(id: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
