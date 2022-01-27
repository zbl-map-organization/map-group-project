// @dart=2.9

import 'package:get_it/get_it.dart';

import '../screens/login/login_viewmodel.dart';
import '../services/user/user_repository.dart';

// import '../services/rest.dart';
// import '../services/number/number_service_rest.dart';
// import '../services/number/number_service_local.dart';
import '../services/number/number_service.dart';
// import '../services/number/number_service_mock.dart';

import '../screens/home/home_viewmodel.dart';

import '../services/number/number_service_firestore.dart';
import '../services/authentication/authentication_service.dart';
import '../services/authentication/authentication_service_firebase.dart';

import '../screens/topic/topic_viewmodel.dart';
import '../services/topic/topic_service.dart';
//import '../services/topic/topic_service_mock.dart';
import '../services/topic/topic_service_firestore.dart';

import '../screens/class/class_viewmodel.dart';
import '../services/class/class_service.dart';
//import '../services/class/class_service_mock.dart';
import '../services/class/class_service_firestore.dart';

GetIt locator = GetIt.instance;

class Value {
  final value;
  Value(this.value);
}

void initializeServiceLocator() {
  // Services
  // locator.registerLazySingleton<RestService>(
  //     () => RestService(baseUrl: 'http://192.168.0.5:3000'));

  locator.registerLazySingleton<NumberService>(() => NumberServiceFirestore());
  // locator.registerLazySingleton<NumberService>(() => NumberServiceMock());
  // locator.registerLazySingleton<NumberService>(() => NumberServiceLocal());
  // locator.registerLazySingleton<NumberService>(() => NumberServiceRest());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceFirebase());
  locator.registerLazySingleton<ClassService>(() => ClassServiceFirestore());
  locator.registerLazySingleton<TopicService>(() => TopicServiceFirestore());
  // Repositories
  locator.registerLazySingleton<UserRepository>(() => UserRepository());

  // Viewmodels
  locator.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
  locator.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel());
  locator.registerLazySingleton<TopicViewmodel>(() => TopicViewmodel());
  locator.registerLazySingleton<ClassViewmodel>(() => ClassViewmodel());
}
