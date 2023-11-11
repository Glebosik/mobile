import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User(
      {required this.id,
      required this.fio,
      required this.location,
      required this.grade});

  @JsonKey(name: 'worker_id')
  final int id;
  @JsonKey(name: 'worker_FIO')
  final String fio;
  @JsonKey(name: 'worker_location')
  final String location;
  @JsonKey(name: 'worker_grade')
  final String grade;

  String cityName() => location.split(',').first;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object> get props => [id];
}
