// Turn of null-safety by writing the following line
// @dart=2.9

import '../../app/service_locator.dart';
import '../rest.dart';
import 'class_service.dart';
import '../../models/class.dart';

/// `NoteServiceRest` is a datbase service for notes that are accessed from a REST service.
///
class ClassServiceRest extends ClassService {
  RestService get rest => locator();

  @override
  Future<List<Class>> fetchClasses() async {
    final jsonList = await rest.get('classes');
    return (jsonList as List).map((json) => Class.fromJson(json)).toList();
  }

  @override
  Future<Class> getClass(id) async {
    final json = await rest.get('classes/$id');
    return Class.fromJson(json);
  }

  @override
  Future<Class> updateClass({id, Class data}) async {
    final json = await rest.patch('classes/$id', data: data);
    return Class.fromJson(json);
  }

  @override
  Future<void> removeClass(id) async {
    await rest.delete('classes/$id');
  }

  @override
  Future<Class> addClass(Class data) async {
    final json = await rest.post('classes', data: data);
    return Class.fromJson(json);
  }
}
