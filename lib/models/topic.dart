//! Define the model class here

class Topic {
  dynamic _id;
  String _title;
  String _desc;
  String _link;
  String _formLvl;
  String _babNum;

  get id => id;
  set id(value) => _id = id;
  get title => _title;
  set title(value) => _title = value;
  get desc => _desc;
  set desc(value) => _desc = value;
  get link => _link;
  set link(value) => _link = value;
  get formLvl => _formLvl;
  set formLvl(value) => _formLvl = value;
  get babNum => _babNum;
  set babNum(value) => _babNum = value;

  Topic({id, title, desc, link, formLvl, babNum})
      : _id = id,
        _title = title,
        _desc = desc,
        _link = link,
        _formLvl = formLvl,
        _babNum = babNum;

  Topic.copy(Topic from)
      : this(
            id: from.id,
            title: from.title,
            desc: from.desc,
            link: from.link,
            formLvl: from.formLvl,
            babNum: from.babNum);

  Topic.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            desc: json['desc'],
            link: json['link'],
            formLvl: json['formLvl'],
            babNum: json['babNum']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'link': link,
        'formLvl': formLvl,
        'babNum': babNum
      };

  Topic copyWith({id, title, desc, link, form}) => Topic(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        link: link ?? this.link,
        formLvl: formLvl ?? this.formLvl,
        babNum: babNum ?? this.babNum,
      );
}
