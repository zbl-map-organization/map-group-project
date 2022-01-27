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

  // Repositories
  locator.registerLazySingleton<UserRepository>(() => UserRepository());

  // Viewmodels
  locator.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
  locator.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel());
}
