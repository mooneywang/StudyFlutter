import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {

  String name;
  String email;

  @JsonKey(name: 'tel_num')
  String telNum;

  Person(this.name, this.email, this.telNum);

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this); 

}