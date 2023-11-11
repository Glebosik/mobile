import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/widgets.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';
import 'package:shimmer/shimmer.dart';

class CommunityView extends StatefulWidget {
  const CommunityView(
      {super.key,
      required this.completedTasks,
      required this.place,
      required this.percent,
      required this.progress,
      required this.user,
      required this.courses,
      required this.coursesTotal,
      required this.cards,
      required this.cardsTotal});
  final int completedTasks;
  final int place;
  final int percent;
  final int progress;
  final User user;
  final int courses;
  final int coursesTotal;
  final int cards;
  final int cardsTotal;

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView>
    with TickerProviderStateMixin {
  late AnimationController controllerCards;
  late AnimationController controllerCourses;

  @override
  void initState() {
    controllerCards = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      lowerBound: 0,
      upperBound: widget.cards / widget.cardsTotal,
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controllerCourses = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      lowerBound: 0,
      upperBound: widget.courses / widget.coursesTotal,
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controllerCards.forward();
    controllerCourses.forward();
    super.initState();
  }

  @override
  void dispose() {
    controllerCards.dispose();
    controllerCourses.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: myAppBar('Сообщество'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 24, 12, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Align(
                        alignment: Alignment.center,
                        child: MyAssets.images.communityLevel.svg()),
                    Align(
                      alignment: Alignment.center,
                      child: Text('3', style: TextStyles.white16),
                    ),
                  ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.user.fio.split(' ').first,
                            style: TextStyles.blue20),
                        Text(
                          '${widget.user.fio.split(' ')[1]} ${widget.user.fio.split(' ')[2]}',
                          style: TextStyles.black20,
                        ),
                      ]),
                  Center(
                    child: IconButton(
                      iconSize: 32,
                      icon: const Icon(Icons.history),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(48, 24, 48, 24),
              child: Container(
                decoration: BoxDecoration(
                    color: MyColors.grayDark,
                    borderRadius: BorderRadius.circular(24)),
                child: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.centerRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              MyColors.black.withAlpha(200),
                              Colors.transparent
                            ],
                                stops: const [
                              0.5,
                              1,
                            ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        alignment: Alignment.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Shimmer.fromColors(
                            baseColor: MyColors.grayText,
                            highlightColor: MyColors.white,
                            direction: ShimmerDirection.ltr,
                            child: MyAssets.images.communityArrows
                                .svg(height: 100)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Всего завершено задач: ',
                                style: TextStyles.white14,
                              ),
                              Text(
                                '${widget.completedTasks}',
                                style: TextStyles.white16,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                'Место в общем рейтинге: ',
                                style: TextStyles.white14,
                              ),
                              Text(
                                '${widget.place}',
                                style: TextStyles.white16,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                'Выполненных задач: ',
                                style: TextStyles.white14,
                              ),
                              Text(
                                '${widget.percent}%',
                                style: TextStyles.white16,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                'Ваш прогресс (за месяц): ',
                                style: TextStyles.white14,
                              ),
                              Text(
                                '+${widget.progress}%',
                                style: TextStyles.white16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(48, 12, 48, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Container(
                          height: height * 0.25,
                          decoration: BoxDecoration(
                              color: MyColors.red,
                              borderRadius: BorderRadius.circular(24)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  height: height * 0.25,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        MyColors.red.withAlpha(100),
                                        MyColors.white.withAlpha(50),
                                      ],
                                          stops: const [
                                        0.4,
                                        1,
                                      ],
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight)),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        '${widget.cards} карт выдано из ${widget.cardsTotal}',
                                        style: TextStyles.white14.copyWith(
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: ProgressIndicator(
                                        height: height * 0.07,
                                        controller: controllerCards,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.25,
                          decoration: BoxDecoration(
                              color: MyColors.blue,
                              borderRadius: BorderRadius.circular(24)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  height: height * 0.25,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Colors.transparent.withAlpha(100),
                                        MyColors.blue,
                                        Colors.grey.withAlpha(50),
                                      ],
                                          stops: const [
                                        0.4,
                                        0.7,
                                        1,
                                      ],
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft)),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: ProgressIndicator(
                                        height: height * 0.07,
                                        controller: controllerCourses,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        '${widget.courses} законченных курсов обучения из ${widget.coursesTotal}',
                                        style: TextStyles.white14.copyWith(
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
    required this.height,
    required this.controller,
  });

  final double height;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      SizedBox(
        height: height,
        width: height,
        child: CircularProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.white.withAlpha(100),
          value: controller.value,
        ),
      ),
      Text(
        '${(controller.upperBound * 100).toInt()}%',
        style: TextStyles.white16,
      )
    ]);
  }
}
