import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/schedule/daily_map.dart';
import 'package:mobile/home/children/schedule/task_info_view.dart';
import 'package:mobile/home/children/widgets/widgets.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView(
      {required this.points,
      required this.results,
      super.key,
      required this.user});

  final List<PlacemarkMapObject> points;
  final List<DrivingSessionResult> results;
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
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DailyMapView(
                                points: points,
                                drivingSessionResults: results)));
                      },
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
                    child: DayView(
                      events: [
                        dayViewEvent(
                            context: context,
                            task: Task(
                              id: '1',
                              date: '2023_11_10',
                              type: 1,
                              title: 'Доставка карт и материалов',
                              priority: 'top',
                              leadTime: 2,
                              level: 'jun',
                              point_id: 1,
                              point_address:
                                  'ул. им. Героя Аверкиева А.А., д. 8/1 к. мая, кв. 268',
                              status: 'in_process',
                              start: DateTime.utc(2023, 11, 10, 9),
                              end: DateTime.utc(2023, 11, 10, 11, 30),
                            )),
                        dayViewEvent(
                            context: context,
                            task: Task(
                              id: '2',
                              date: '2023_11_10',
                              type: 2,
                              title: 'Обучение агента',
                              priority: 'top',
                              leadTime: 2,
                              level: 'jun',
                              point_id: 1,
                              point_address: 'ул. Северная, д. 389',
                              status: 'in_process',
                              start: DateTime.utc(2023, 11, 10, 11, 30),
                              end: DateTime.utc(2023, 11, 10, 14),
                            )),
                        dayViewEvent(
                            context: context,
                            task: Task(
                              id: '3',
                              date: '2023_11_10',
                              type: 3,
                              title: 'Выезд на точку для стимулирования выдач',
                              priority: 'top',
                              leadTime: 4,
                              level: 'jun',
                              point_id: 1,
                              point_address: 'ул. им. 40-летия Победы, д. 20/1',
                              status: 'in_process',
                              start: DateTime.utc(2023, 11, 10, 14),
                              end: DateTime.utc(2023, 11, 10, 19),
                            )),
                      ],
                      hoursColumnStyle:
                          const HoursColumnStyle(color: Colors.transparent),
                      style: DayViewStyle(
                          headerSize: 0,
                          backgroundColor: Colors.transparent,
                          backgroundRulesColor: Colors.transparent,
                          hourRowHeight: constraints.maxHeight / 11),
                      date: DateTime.utc(2023, 11, 10, 10, 0),
                      minimumTime: const HourMinute(hour: 8, minute: 0),
                      maximumTime: const HourMinute(hour: 19, minute: 0),
                      userZoomable: false,
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

  FlutterWeekViewEvent dayViewEvent(
      {required Task task, required BuildContext context}) {
    Color color;
    switch (task.type) {
      case 1:
        color = MyColors.grayDark;
        break;
      case 2:
        color = MyColors.blue;
        break;
      case 3:
        color = MyColors.red;
        break;
      default:
        color = MyColors.grayDark;
        break;
    }
    return FlutterWeekViewEvent(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TaskInfoView(task: task)));
      },
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
      title: task.title,
      description: task.point_address,
      start: task.start!,
      end: task.end!,
    );
  }
}
