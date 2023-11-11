import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:models/models.dart';

class ScheduleRepository {
  ScheduleRepository(this.apiClient);

  final ApiClient apiClient;

  Future<DaySchedule?> getDaySchedule() async {}
}
