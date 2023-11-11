import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/task/map_view.dart';
import 'package:mobile/home/children/task/radio_icons.dart';
import 'package:mobile/home/children/widgets/widgets.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

enum DialogCommentType { done, canceled, postponed }

class DialogResult {
  DialogResult(this.status, {this.type, this.comment});

  final bool status;
  final DialogCommentType? type;
  final String? comment;
}

class TaskView extends StatefulWidget {
  const TaskView(
      {required this.task,
      required this.points,
      required this.drivingSessionResult,
      super.key});

  final Task task;
  final List<PlacemarkMapObject> points;
  final DrivingSessionResult drivingSessionResult;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    const textColor = Colors.blue;
    return Scaffold(
      body: ExpandableBottomSheet(
        persistentContentHeight: 50,
        expandableContent: Container(
          height: height - 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.white.withAlpha(240),
                Colors.white.withAlpha(150)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 12,
                  blurStyle: BlurStyle.outer,
                )
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 75,
                    height: 5,
                    decoration: BoxDecoration(
                        color: textColor.withAlpha(155),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: textColor,
                        width: 2,
                      ))),
                      child: Text(widget.task.title,
                          style: TextStyles.black20bold.copyWith(
                            color: textColor,
                          )),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Основная информация:',
                      style: TextStyles.black16bold.copyWith(color: textColor),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop,
                        color: textColor,
                      ),
                      const SizedBox(width: 4),
                      Text(widget.task.point_address)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: textColor,
                      ),
                      const SizedBox(width: 4),
                      Text(widget.task.getDateString())
                    ],
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Комментарий:',
                      style: TextStyles.black16bold.copyWith(color: textColor),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Необходимо уточнить нужен ли пакет дополнительных опций для карты'),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Приложенные файлы:',
                        style:
                            TextStyles.black16bold.copyWith(color: textColor)),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: MyAssets.images.file.svg(),
                      ),
                      Text('Нет приложенных файлов',
                          style: TextStyles.black14.copyWith(
                              color: MyColors.grayText.withAlpha(150))),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
        background: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: MapView(
              task: widget.task,
              points: widget.points,
              drivingSessionResult: widget.drivingSessionResult,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: textColor.withAlpha(200),
                          ),
                          onPressed: () async {
                            final result = await showDialog(
                                barrierDismissible: false,
                                useRootNavigator: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    content: SizedBox(
                                      height: 90,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Задача выполнена успешно?',
                                            style: TextStyles.black16,
                                            textAlign: TextAlign.center,
                                          ),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(DialogResult(false));
                                                },
                                                child: const Text('Отмена'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(DialogResult(true));
                                                },
                                                child: const Text(
                                                  'Отправить',
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                    ),
                                  );
                                });
                            if (result != null && result == true) {
                              //TODO: ОТПРАВИТЬ ПОДТВЕРЖДЕНИЕ
                            }
                          },
                          child: Text(
                            'Выполнено',
                            style: TextStyles.white16,
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: textColor.withAlpha(50),
                              side: const BorderSide(color: textColor)),
                          onPressed: () async {
                            int curIndex = 0;
                            TextEditingController controller =
                                TextEditingController();
                            final result = await showDialog(
                                barrierDismissible: false,
                                useRootNavigator: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    content: SizedBox(
                                      height: 250,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Задача:',
                                              style: TextStyles.black16,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          RadioIcons(callback: (int index) {
                                            curIndex = index;
                                          }),
                                          const SizedBox(height: 16),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Комментарий:',
                                              style: TextStyles.black16,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          TextField(
                                            decoration: InputDecoration(
                                                labelText: 'Опишите проблему',
                                                fillColor: MyColors.grayDark
                                                    .withAlpha(20)),
                                            controller: controller,
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(DialogResult(false));
                                                },
                                                child: const Text('Отмена'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  DialogCommentType type;
                                                  switch (curIndex) {
                                                    case 0:
                                                      type = DialogCommentType
                                                          .done;
                                                      break;
                                                    case 1:
                                                      type = DialogCommentType
                                                          .canceled;
                                                      break;
                                                    case 2:
                                                      type = DialogCommentType
                                                          .postponed;
                                                      break;
                                                    default:
                                                      type = DialogCommentType
                                                          .done;
                                                      break;
                                                  }
                                                  Navigator.of(context).pop(
                                                      DialogResult(true,
                                                          type: type,
                                                          comment:
                                                              controller.text));
                                                },
                                                child: const Text(
                                                  'Отправить',
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                    ),
                                  );
                                });
                            if (result != null) {
                              //TODO: отправить данные о задаче на сервер
                              print((result as DialogResult).type);
                              print((result as DialogResult).comment);
                              print((result as DialogResult).status);
                            }
                          },
                          child: Text(
                            'Возникли сложности?',
                            style:
                                TextStyles.black16.copyWith(color: textColor),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
