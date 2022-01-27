import 'dart:async';
import '../../models/user.dart';
import '../../app/service_locator.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class HomeViewmodel extends Viewmodel {
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
      } else {
        init();
      }
      notifyListeners();
    });
  }

  @override
  void init() async => await update(() async {
        if (user == null) return;
        _ulist = await dataService.fetchUsers();
        super.init();
      });

  @override
  void dispose() {
    _streamObserver?.cancel();
    _streamObserver = null;
    super.dispose();
  }


  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    await _userRepository.signOut();
  }
}
