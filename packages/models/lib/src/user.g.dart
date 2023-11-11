// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['worker_id'] as int,
      fio: json['worker_FIO'] as String,
      location: json['worker_location'] as String,
      grade: json['worker_grade'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'worker_id': instance.id,
      'worker_FIO': instance.fio,
      'worker_location': instance.location,
      'worker_grade': instance.grade,
    };
