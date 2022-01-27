//! Define the model class here

class Class {
  dynamic _id;
  String _classDate;
  String _classLink;
  String _classTime;
  String _status;

  get id => _id;
  set id(value) => _id = id;

  get classDate => _classDate;
  set classDate(value) => _classDate = value;

  get classLink => _classLink;
  set classLink(value) => _classLink = value;

  get classTime => _classTime;
  set classTime(value) => _classTime = value;

  get status =>_status;
  set status(value) => _status = value;

  Class({id, classDate, classLink, classTime, status})
      : _id = id,
        _classDate = classDate,
        _classLink = classLink,
        _classTime = classTime,
        _status = status;

  Class.copy(Class from)
      : this(
            id: from.id,
            classDate: from.classDate,
            classLink: from.classLink,
            classTime: from.classTime,
            status: from.status);

  Class.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            classDate: json['classDate'],
            classLink: json['classLink'],
            classTime: json['classTime'],
            status: json['status']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'classDate': classDate,
        'classLink': classLink,
        'classTime': classTime,
        'status': status,
      };

  Class copyWith({id, classDate, classLink, classTime, form}) => Class(
        id: id ?? this.id,
        classDate: classDate ?? this.classDate,
        classLink: classLink ?? this.classLink,
        classTime: classTime ?? this.classTime,
        status: status ?? this.status,
          );
}
