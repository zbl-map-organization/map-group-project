// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of each method of this service class.

import '../../app/service_locator.dart';
import '../rest.dart';
import 'topic_service.dart';
import '../../models/topic.dart';

/// `NoteServiceRest` is a datbase service for notes that are accessed from a REST service.
///
class TopicServiceRest extends TopicService {
  RestService get rest => locator();

  @override
  Future<List<Topic>> fetchTopics() async {
    final jsonList = await rest.get('topics');
    return (jsonList as List).map((json) => Topic.fromJson(json)).toList();
  }

  @override
  Future<Topic> getTopic(id) async {
    final json = await rest.get('topics/$id');
    return Topic.fromJson(json);
  }

  @override
  Future<Topic> updateTopic({id, Topic data}) async {
    final json = await rest.patch('topics/$id', data: data);
    return Topic.fromJson(json);
  }

  @override
  Future<void> removeTopic(id) async {
    await rest.delete('topics/$id');
  }

  @override
  Future<Topic> addTopic(Topic data) async {
    final json = await rest.post('topics', data: data);
    return Topic.fromJson(json);
  }
}
