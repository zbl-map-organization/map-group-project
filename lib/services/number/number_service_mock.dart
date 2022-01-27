// @dart=2.9

import 'number_service.dart';
import '../../models/number.dart';

class NumberServiceMock extends NumberService {
  final _mockDb = <Number>[
    Number(id: 1, value: 100),
    Number(id: 2, value: 200)
  ];

  @override
  Future<List<Number>> fetchNumbers() async {
    // Change the duration to a bigger value to test the progress indicator
    await Future.delayed(Duration(seconds: 1));
    return [..._mockDb];
  }

  @override
  Future<Number> getNumber(id) async {
    await Future.delayed(Duration(seconds: 1));
    return _mockDb.firstWhere((number) => number.id == id, orElse: null);
  }

  @override
  Future<Number> updateNumber({id, Number data}) async {
    // Change the duration to a bigger value to test the progress indicator
    await Future.delayed(Duration(seconds: 1));

    final index = _mockDb.indexWhere((number) => number.id == id);
    if (index == -1) return null;
    _mockDb[index] = data.copyWith(id: id);
    return Number.copy(_mockDb[index]);
  }

  @override
  Future<void> deleteNumber(id) async {
    // Change the duration to a bigger value to test the progress indicator
    await Future.delayed(Duration(seconds: 1));
    _mockDb.removeWhere((number) => number.id == id);
  }

  @override
  Future<Number> addNumber(Number data) async {
    // Change the duration to a bigger value to test the progress indicator
    await Future.delayed(Duration(seconds: 1));

    final Number number = data.copyWith(id: _mockDb.last.id + 1);
    _mockDb.add(number);
    return Number.copy(number);
  }
}
