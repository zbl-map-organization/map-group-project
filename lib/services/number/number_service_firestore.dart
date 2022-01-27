// @dart=2.9

import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'number_service.dart';
import '../../models/number.dart';

class NumberServiceFirestore extends NumberService {
  // static const String _userId = 'hm2leHyBDdYoMxF8hyqceJrs9rF2';
  String get _userId => user.uid;
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection => _firestore
      .collection('numbers/$_userId/items'); // use path style to reference
  // _firestore.collection('numbers').doc(_userId).collection('numbers'); // alternative reference

  DocumentReference _getNumberDocument(numberId) => _firestore.document(
      'numbers/$_userId/items/$numberId'); // use path style to reference

  @override
  Stream get stream => _collection.snapshots();

  @override
  Future<List<Number>> fetchNumbers() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final number = Number.fromJson(doc.data()).copyWith(
          id: doc
              .id); // transform data. Field id might be null, so take the doc id instead
      return number;
    }).toList();
  }

  @override
  Future<Number> getNumber(id) async {
    final n = await _getNumberDocument(id).get();
    return Number.fromJson(n.data());
  }

  @override
  Future<Number> updateNumber({id, Number data}) async {
    final update = data.copyWith(id: id);
    await _getNumberDocument(id).update(update.toJson());
    return update;
  }

  @override
  Future<void> deleteNumber(id) async {
    await _getNumberDocument(id).delete();
  }

  @override
  Future<Number> addNumber(Number data) async {
    final _id = _idGenerator.v1(); // Generate time-based id
    final _data = data.copyWith(id: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
