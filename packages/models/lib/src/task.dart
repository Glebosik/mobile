import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'task.g.dart';

@JsonSerializable()
class Task extends Equatable {
  Task(
      {required this.id,
      required this.type,
      required this.title,
      required this.priority,
      required this.leadTime,
      required this.level,
      required this.point_id,
      required this.point_address,
      required this.date,
      required this.status,
      this.start,
      this.end,
      this.lat,
      this.lon});
  @JsonKey(name: 'idt')
  final String id;
  @JsonKey(name: 'task_type')
  final int type;
  @JsonKey(name: 'task_title')
  final String title;
  @JsonKey(name: 'task_priority')
  final String priority;
  @JsonKey(name: 'task_lead_time')
  final double leadTime;
  @JsonKey(name: 'task_level')
  final String level;
  final int point_id;
  final String point_address;
  final String date;
  final String status;
  DateTime? start;
  DateTime? end;
  double? lat;
  double? lon;

  DateTime Date() {
    return DateTime.parse(date.replaceAll('_', '-'))
        .toLocal()
        .add(Duration(hours: 11));
  }

  String getDateString() {
    final localDate = Date();
    return "${DateFormat.MMMMd('ru_RU').format(localDate)} ${DateFormat.jm('ru').format(localDate)}";
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  @override
  List<Object> get props => [id];
}
