// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaySchedule _$DayScheduleFromJson(Map<String, dynamic> json) => DaySchedule(
      id: json['id'] as int,
      date: json['date'] as String,
      schedule: json['schedule'] as String,
    );

Map<String, dynamic> _$DayScheduleToJson(DaySchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'schedule': instance.schedule,
    };
