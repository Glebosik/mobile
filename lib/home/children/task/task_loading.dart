import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/widgets.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class TaskViewLoading extends StatefulWidget {
  const TaskViewLoading({super.key});

  @override
  State<TaskViewLoading> createState() => _TaskViewLoadingState();
}

class _TaskViewLoadingState extends State<TaskViewLoading>
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
                      child: Text('Ожидаем задачу...',
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
                  Shimmer.fromColors(
                    baseColor: MyColors.blue,
                    highlightColor: MyColors.red,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: textColor,
                        ),
                        SizedBox(width: 4),
                        Text('')
                      ],
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: MyColors.blue,
                    highlightColor: MyColors.red,
                    child: const Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: textColor,
                        ),
                        SizedBox(width: 4),
                        Text('')
                      ],
                    ),
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
                  Shimmer.fromColors(
                    baseColor: MyColors.blue,
                    highlightColor: MyColors.red,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(''),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Приложенные файлы:',
                        style:
                            TextStyles.black16bold.copyWith(color: textColor)),
                  ),
                ],
              ),
            ),
          ),
        ),
        background: Stack(children: [
          const Align(
            alignment: Alignment.center,
            child: YandexMap(),
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
                          onPressed: null,
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
                          onPressed: null,
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
