import 'dart:async';

import '../../models/user.dart';
import '../../app/service_locator.dart';
import '../../services/number/number_service.dart';
import '../../models/number.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class HomeViewmodel extends Viewmodel {
  List<Number> _list;
  final NumberService _service = locator();
  UserService get dataService => locator<UserService>();

  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;
  List<User> _ulist;
  User getUser(id) {
    int i = _ulist.indexWhere((user) => user.uid == id);
    return _ulist[i];
  }

  HomeViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
        _list = null;
      } else {
        init();
      }
      notifyListeners();
    });
  }

  @override
  void init() async => await update(() async {
        if (user == null) return;

        _list = await _service.fetchNumbers();
        _streamObserver = _service.observeStream(
            onData: (receivedData) async => await update(() async => _list =
                (receivedData.docs as List)
                    .map((doc) => Number.fromJson(doc.data()))
                    .toList()),
            onError: (e) => print(e));
        _ulist = await dataService.fetchUsers();

        super.init();
      });

  @override
  void dispose() {
    _streamObserver?.cancel();
    _streamObserver = null;
    super.dispose();
  }

  int get dataCount => _list == null ? 0 : _list.length;

  Future<void> addNumber(Number number) async => await update(() async {
        if (user == null) return;

        final Number dbNumber = await _service.addNumber(number);

        // The flag is meant for preventing duplicate update on the viewmodel state, in case
        // linking to a stream, like in the case of firestore

        if (!isObservingStream) _list.add(dbNumber);
      });

  Future<void> deleteNumber(dynamic id) async => await update(() async {
        await _service.deleteNumber(id);
        _list.removeWhere((number) => number.id == id);
      });

  Future<void> updateNumber({dynamic id, Number data}) async =>
      await update(() async {
        final Number dbNumber = await _service.updateNumber(id: id, data: data);
        final index = _list.indexWhere((number) => number.id == dbNumber.id);
        if (index == -1) return;

        if (!isObservingStream) _list[index] = dbNumber;
      });

  Number getNumber(int index) => _list == null ? null : _list[index];

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    _list = null;
    await _userRepository.signOut();
  }
}
