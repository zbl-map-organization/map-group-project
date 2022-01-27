// @dart=2.9

import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'user_service.dart';
import '../../models/user.dart';

class UserServiceFirestore extends UserService {
  // static const String _userId = 'hm2leHyBDdYoMxF8hyqceJrs9rF2';
  String get _userId => user.uid;
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection =>
      _firestore.collection('users'); // use path style to reference
  // _firestore.collection('classs').doc(_userId).collection('classs'); // alternative reference

  DocumentReference _getUserDocument(userId) =>
      _firestore.document('users/$_userId'); // use path style to reference

  @override
  Stream get stream => _collection.snapshots();

  @override
  Future<User> getUser(id) async {
    final n = await _getUserDocument(id).get();
    return User.fromJson(n.data());
  }

  @override
  Future<User> updateUser({User data}) async {
    final update = data.copyWith(uid: _userId);
    await _getUserDocument(_userId).update(update.toJson());
    return update;
  }

  @override
  Future<void> removeUser(id) async {
    await _getUserDocument(id).delete();
  }

  @override
  Future<User> addUser(User data) async {
    final _id = data.uid; // Generate time-based id
    final _data = data.copyWith(uid: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
