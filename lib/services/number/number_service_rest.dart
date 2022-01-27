// @dart=2.9

import '../../app/service_locator.dart';
import '../rest.dart';
import 'number_service.dart';
import '../../models/number.dart';

class NumberServiceRest extends NumberService {
  RestService get rest => locator();

  // alternative to get Rest service, is by calling directly in this class.
  // final rest = RestService(baseUrl: 'http://192.168.0.5:3000');

  @override
  Future<List<Number>> fetchNumbers() async {
    final jsonList = await rest.get('numbers');
    return (jsonList as List).map((json) => Number.fromJson(json)).toList();
  }

  @override
  Future<Number> getNumber(id) async {
    final json = await rest.get('Numbers/$id');
    return Number.fromJson(json);
  }

  @override
  Future<Number> updateNumber({id, Number data}) async {
    final json = await rest.patch('Numbers/$id', data: data);
    return Number.fromJson(json);
  }

  @override
  Future<void> deleteNumber(id) async {
    await rest.delete('Numbers/$id');
  }

  @override
  Future<Number> addNumber(Number data) async {
    final json = await rest.post('Numbers', data: data);
    return Number.fromJson(json);
  }
}
