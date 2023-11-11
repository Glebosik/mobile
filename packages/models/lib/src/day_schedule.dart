import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'day_schedule.g.dart';

@JsonSerializable()
class DaySchedule extends Equatable {
  const DaySchedule({
    required this.id,
    required this.date,
    required this.schedule,
  });
  final int id;
  final String date;
  final String schedule;

  factory DaySchedule.fromJson(Map<String, dynamic> json) =>
      _$DayScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$DayScheduleToJson(this);

  @override
  List<Object> get props => [id];
}
