// Turn of null-safety by writing the following line
// @dart=2.9
import 'package:flutter/material.dart';

import '../../app/service_locator.dart';
import '../../models/topic.dart';
import '../../services/topic/topic_service.dart';
import '../viewmodel.dart';

class TopicViewmodel extends Viewmodel {
  final _service = locator<TopicService>();
  List<Topic> _list;

  TopicViewmodel();

  Topic getTopic(int index) => _list == null ? null : _list[index];
  int get dataCount => _list == null ? 0 : _list.length;

  init() => update(() async {
        _list = await _service.fetchTopics();
        super.init();
      });

  void navigate({context, index, text}) async {
    await Navigator.pushNamed(context, '/inputScreen',
        arguments: {'index': index, 'text': text});
  }

  void addTopic(Topic topic) => update(() async {
        final item = await _service.addTopic(topic);
        _list.add(item);
      });
  void deleteTopic(dynamic id) => update(() async {
        await _service.removeTopic(id);
        _list.removeWhere((topic) => topic.id == id);
      });
  void updateTopic({dynamic id, Topic data}) => update(() async {
        final item = await _service.updateTopic(id: id, data: data);
        final index = _list.indexWhere((topic) => topic.id == id);
        if (index == -1) return;
        _list[index] = item;
      });
}
