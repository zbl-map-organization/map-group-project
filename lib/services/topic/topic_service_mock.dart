//! Create the mock database here which consists of a list of notes. The note data is hard coded.

import 'topic_service.dart';
import '../../models/topic.dart';

class TopicServiceMock extends TopicService {
  final _mockTopicList = <Topic>[
    Topic(
        id: 1,
        title: "Warisan Negara Bangsa",
        desc:
            "Bab ini mengandungi latar belakang negara bangsa sebelum kedatangan barat, ciri-ciri negara bangsa kesultanan melayu melaka,keunggulan sistem pendtadbiran dan undang-undang dan peranan pemerintah dan rakyat.",
        link:
            "https://gurubesar.my/wp-content/uploads/2019/01/BAB-1-WARISAN-NEGARA-BANGSA.pdf",
        formLvl: "4",
        babNum: "1"),
    Topic(
        id: 2,
        title: "Kebangkitan Nasionalisme",
        desc:
            "Bab ini mengandungi nasionalisme, perkembangan idea nasionalisme di barat, asia dan asia tenggara, kesedaran nasionalisme di negara kita, faktor kemunculan gerakan nasionalisme dan perkembangan nasionalisme.",
        link:
            "https://gurubesar.my/wp-content/uploads/2019/01/TINGKATAN-4-SEJARAH-2020-BAB-2-KEBANGKITAN-NASIONALISME.pdf",
        formLvl: "4",
        babNum: "2"),
    Topic(
        id: 3,
        title: "Konflik Dunia Pendudukan Jepun di Negara Kita",
        desc:
            "Bab ini mengandungi nasionalisme di negara kita sebelum perang dunia, latar belakang perang dunia, perang dunia kedua, perang dunia kedua di asia pasifik, faktor kedatangan jepun ke negara kita, dasar pendudukan jepun di negara kita dan sebagainya",
        link:
            "https://gurubesar.my/wp-content/uploads/2019/01/BAB-3-KONFLIK-DUNIA-DAN-PENDUDUKAN-JEPUN-DI-NEGARA-KITA-oleh-Cikgu-Rama-.pdf",
        formLvl: "4",
        babNum: "3"),
  ];
  @override
  Future<List<Topic>> fetchTopics() async {
    await Future.delayed(Duration(seconds: 2));
    return [..._mockTopicList];
  }

  @override
  Future<Topic> getTopic(id) async {
    await Future.delayed(Duration(seconds: 2));
    final item = _mockTopicList.firstWhere((topic) => topic.id == id);
    return Topic.copy(item);
  }

  @override
  Future<Topic> updateTopic({id, Topic data}) async {
    final index = _mockTopicList.indexWhere((note) => note.id == id);
    if (index == -1) return null;
    Topic item = data.copyWith(id: id);
    _mockTopicList[index] = item;
    return Topic.copy(_mockTopicList[index]);
  }

  @override
  Future<void> removeTopic(id) async {
    _mockTopicList.removeWhere((topic) => topic.id == id);
  }

  @override
  Future<Topic> addTopic(Topic data) async {
    await Future.delayed(Duration(seconds: 2));
    int id = (_mockTopicList != null && _mockTopicList.length > 0)
        ? _mockTopicList.last.id + 1
        : 1;
    Topic item = data.copyWith(id: id);
    _mockTopicList.add(item);
    return Topic.copy(item);
  }
}
