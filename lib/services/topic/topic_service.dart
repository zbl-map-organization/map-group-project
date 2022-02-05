// Turn of null-safety by writing the following line
// @dart=2.9

import 'dart:async';

import '../../models/topic.dart';

abstract class TopicService {
  Future<List<Topic>> fetchTopics();
  Future<Topic> getTopic(id);
  Future<Topic> updateTopic({id, Topic data});
  Future<void> removeTopic(id);
  Future<Topic> addTopic(Topic data);

  // this getter is to be overidden, if the service supports stream such as firestore
  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
