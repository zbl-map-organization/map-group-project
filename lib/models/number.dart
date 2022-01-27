// @dart=2.9

//? Author: jumail@utm.my
//? Date: 2 Jan 2022

class Number {
  final dynamic id;
  final int value;

  /// Constructors
  const Number({this.id, this.value});
  Number.copy(from) : this(id: from.id, value: from.value);

  /// `fromJson` and `toJson` are to facilate conversion from / to json string
  /// The are required when communicating with external componets e.g.
  /// backend (such as JSON server)
  ///
  Number.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], value: json['value']);

  Map<String, dynamic> toJson() => {'id': id, 'value': value};

  /// `copyWith` creates a copy of the object with modified value of
  /// specified attributes. Ths method is to facilate the data `immutability` feature.
  /// With data immutability, when it comes to modifying values,
  /// we do not change the original object, instead, create a copy of the object and
  /// modify the required attributes

  Number copyWith({id, value}) =>
      Number(id: id ?? this.id, value: value ?? this.value);
}
