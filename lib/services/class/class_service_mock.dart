//! Create the mock database here which consists of a list of notes. The note data is hard coded.
import 'class_service.dart';
import '../../models/class.dart';

class ClassServiceMock extends ClassService {
  final _mockClassList = <Class>[
    Class(
      id: 1,
      classTitle: "Class Lesson 1",
      classDate: "31/1/2022",
      classTime: "8.00 p.m. - 10.00 p.m.",
      classLink: "https://meet.google.com/mha-zeuw-kti",
    ),
    Class(
      id: 2,
      classTitle: "Class Lesson 2",
      classDate: "1/2/2022",
      classTime: "8.00 p.m. - 10.00 p.m.",
      classLink: "https://meet.google.com/wpp-bzrg-rcg",
    ),
    Class(
      id: 3,
      classTitle: "Class Lesson 3",
      classDate: "2/2/2022",
      classTime: "8.00 p.m. - 10.00 p.m.",
      classLink: "https://meet.google.com/ebd-odxw-nbm",
    ),
  ];

  @override
  Future<List<Class>> fetchClasses() async {
    await Future.delayed(Duration(seconds: 2));
    return [..._mockClassList];
  }

  @override
  Future<Class> getClass(id) async {
    await Future.delayed(Duration(seconds: 2));
    final item = _mockClassList.firstWhere((_class) => _class.id == id);
    return Class.copy(item);
  }

  @override
  Future<Class> updateClass({id, Class data}) async {
    final index = _mockClassList.indexWhere((note) => note.id == id);
    if (index == -1) return null;
    Class item = data.copyWith(id: id);
    _mockClassList[index] = item;
    return Class.copy(_mockClassList[index]);
  }

  @override
  Future<void> removeClass(id) async {
    _mockClassList.removeWhere((_class) => _class.id == id);
  }

  @override
  Future<Class> addClass(Class data) async {
    await Future.delayed(Duration(seconds: 2));
    int id = (_mockClassList != null && _mockClassList.length > 0)
        ? _mockClassList.last.id + 1
        : 1;
    Class item = data.copyWith(id: id);
    _mockClassList.add(item);
    return Class.copy(item);
  }
}
