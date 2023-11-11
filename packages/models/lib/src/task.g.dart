// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['idt'] as String,
      type: json['task_type'] as int,
      title: json['task_title'] as String,
      priority: json['task_priority'] as String,
      leadTime: (json['task_lead_time'] as num).toDouble(),
      level: json['task_level'] as String,
      point_id: json['point_id'] as int,
      point_address: json['point_address'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'idt': instance.id,
      'task_type': instance.type,
      'task_title': instance.title,
      'task_priority': instance.priority,
      'task_lead_time': instance.leadTime,
      'task_level': instance.level,
      'point_id': instance.point_id,
      'point_address': instance.point_address,
      'date': instance.date,
      'status': instance.status,
    };
