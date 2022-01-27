// @dart=2.9

import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'class_service.dart';
import '../../models/class.dart';

class ClassServiceFirestore extends ClassService {
  // static const String _userId = 'hm2leHyBDdYoMxF8hyqceJrs9rF2';
  String get _userId => user.uid;
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection => _firestore
      .collection('class/GeneralClass/items'); // use path style to reference
  // _firestore.collection('topics').doc('GeneralTopic').collection('items'); // alternative reference

  DocumentReference _getClassDocument(classId) => _firestore.document(
      'class/GeneralClass/items/$classId'); // use path style to reference

  @override
  Stream get stream => _collection.snapshots();

  @override
  Future<List<Class>> fetchClasses() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final _class = Class.fromJson(doc.data()).copyWith(
          id: doc
              .id); // transform data. Field id might be null, so take the doc id instead
      return _class;
    }).toList();
  }

  @override
  Future<Class> getClass(id) async {
    final n = await _getClassDocument(id).get();
    return Class.fromJson(n.data());
  }

  @override
  Future<Class> updateClass({id, Class data}) async {
    print('Firebase Update Class $id');
    final update = data.copyWith(id: id);
    await _getClassDocument(id).update(update.toJson());
    return update;
  }

  @override
  Future<void> removeClass(id) async {
    await _getClassDocument(id).delete();
  }

  @override
  Future<Class> addClass(Class data) async {
    final _id = _idGenerator.v1(); // Generate time-based id
    final _data = data.copyWith(id: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
