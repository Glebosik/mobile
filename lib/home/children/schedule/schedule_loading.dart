import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/widgets.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleViewLoading extends StatelessWidget {
  const ScheduleViewLoading({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Расписание'),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Добрый день, ', style: TextStyles.gray16),
                      Text(user.fio.split(' ')[1], style: TextStyles.red16),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: null,
                      child: Text(
                        'Маршрут',
                        style: TextStyles.white16,
                      ))
                ],
              ),
            ),
            TableCalendar(
              locale: 'ru_RU',
              availableCalendarFormats: const {CalendarFormat.week: 'Неделя'},
              calendarFormat: CalendarFormat.week,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: ((context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Shimmer.fromColors(
                      baseColor: MyColors.blue,
                      highlightColor: MyColors.red,
                      child: DayView(
                        events: [
                          dayViewEvent(
                              color: MyColors.blue,
                              title: '',
                              description: '',
                              start: DateTime.utc(2023, 11, 9, 9, 0),
                              end: DateTime.utc(2023, 11, 9, 11, 0)),
                          dayViewEvent(
                              color: MyColors.black,
                              title: '',
                              description: '',
                              start: DateTime.utc(2023, 11, 9, 11, 30),
                              end: DateTime.utc(2023, 11, 9, 13, 30)),
                          dayViewEvent(
                              color: MyColors.red,
                              title: '',
                              description: '',
                              start: DateTime.utc(2023, 11, 9, 14, 0),
                              end: DateTime.utc(2023, 11, 9, 18, 0)),
                        ],
                        hoursColumnStyle:
                            const HoursColumnStyle(color: Colors.transparent),
                        style: DayViewStyle(
                            headerSize: 0,
                            backgroundColor: Colors.transparent,
                            backgroundRulesColor: Colors.transparent,
                            hourRowHeight: constraints.maxHeight / 11),
                        date: DateTime.utc(2023, 11, 9, 10, 0),
                        minimumTime: const HourMinute(hour: 8, minute: 0),
                        maximumTime: const HourMinute(hour: 19, minute: 0),
                        userZoomable: false,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }

  FlutterWeekViewEvent dayViewEvent({
    required Color color,
    required String title,
    required String description,
    required DateTime start,
    required DateTime end,
  }) {
    return FlutterWeekViewEvent(
      decoration: BoxDecoration(
        color: color.withAlpha(50),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        border: Border(
            left: BorderSide(color: color, width: 8),
            right: BorderSide(color: color, width: 0),
            top: BorderSide(color: color, width: 0),
            bottom: BorderSide(color: color, width: 0)),
      ),
      textStyle: TextStyles.black14.copyWith(color: color),
      title: title,
      description: description,
      start: start,
      end: end,
    );
  }
}
