class Class {
  dynamic _id;
  String _classTitle;
  String _classDate;
  String _classLink;
  String _classTime;
  String _tutorID;
  String _studentID;
  String _status;

  get id => _id;
  set id(value) => _id = id;

  get classTitle => _classTitle;
  set classTitle(value) => _classTitle = value;

  get classDate => _classDate;
  set classDate(value) => _classDate = value;

  get classLink => _classLink;
  set classLink(value) => _classLink = value;

  get classTime => _classTime;
  set classTime(value) => _classTime = value;

  get tutorID => _tutorID;
  set tutorID(value) => _tutorID = value;

  get studentID => _studentID;
  set studentID(value) => _studentID = value;

  get status => _status;
  set status(value) => _status = value;

  Class({id, classTitle,classDate, classLink, classTime, tutorID, studentID, status})
      : _id = id,
        _classTitle = classTitle,
        _classDate = classDate,
        _classLink = classLink,
        _classTime = classTime,
        _tutorID = tutorID,
        _studentID = studentID,
        _status = status;

  Class.copy(Class from)
      : this(
            id: from.id,
            classTitle: from.classTitle,
            classDate: from.classDate,
            classLink: from.classLink,
            classTime: from.classTime,
            tutorID: from.tutorID,
            studentID: from.studentID,
            status: from.status);

  Class.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            classTitle: json['classTitle'],
            classDate: json['classDate'],
            classLink: json['classLink'],
            classTime: json['classTime'],
            tutorID: json['tutorID'],
            studentID: json['studentID'],
            status: json['status']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'classTitle': classTitle,
        'classDate': classDate,
        'classLink': classLink,
        'classTime': classTime,
        'tutorID': tutorID,
        'studentID': studentID,
        'status': status,
      };

  Class copyWith({id, classTitle, classDate, classLink, classTime, form}) => Class(
        id: id ?? this.id,
        classTitle: classTitle ?? this.classTitle,
        classDate: classDate ?? this.classDate,
        classLink: classLink ?? this.classLink,
        classTime: classTime ?? this.classTime,
        tutorID: tutorID ?? this.tutorID,
        studentID: studentID ?? this.studentID,
        status: status ?? this.status,
      );
}
