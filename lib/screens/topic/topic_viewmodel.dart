// Turn of null-safety by writing the following line
// @dart=2.9
import 'package:flutter/material.dart';
import '../../app/service_locator.dart';
import '../../models/topic.dart';
import '../../models/user.dart';
import '../../services/topic/topic_service.dart';
import '../viewmodel.dart';
import '../../services/user/user_service.dart';
import '../../services/user/user_repository.dart';

class TopicViewmodel extends Viewmodel {
  final _service = locator<TopicService>();
  List<Topic> _list;
  List<Topic> get list => _list;
  UserService get dataService => locator<UserService>();
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;
  Topic getTopic(int index) => _list == null ? null : _list[index];
  int get dataCount => _list == null ? 0 : _list.length;
  List<User> _ulist;
  User getUser(id) {
    int i = _ulist.indexWhere((user) => user.uid == id);
    return _ulist[i];
  }

  init() => update(() async {
        _list = await _service.fetchTopics();
        _ulist = await dataService.fetchUsers();
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
