import 'package:flutter/material.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/widgets.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';
import 'package:shimmer/shimmer.dart';

class CommunityViewLoading extends StatelessWidget {
  const CommunityViewLoading({super.key, required this.user});
  final User user;

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
                        Text(user.fio.split(' ').first,
                            style: TextStyles.blue20),
                        Text(
                          '${user.fio.split(' ')[1]} ${user.fio.split(' ')[2]}',
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
              child: Shimmer.fromColors(
                baseColor: MyColors.grayDark,
                highlightColor: MyColors.grayDark.withAlpha(100),
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
                                  '',
                                  style: TextStyles.white14,
                                ),
                                Text(
                                  '',
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
                                  '',
                                  style: TextStyles.white14,
                                ),
                                Text(
                                  '',
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
                                  '',
                                  style: TextStyles.white14,
                                ),
                                Text(
                                  '',
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
                                  '',
                                  style: TextStyles.white14,
                                ),
                                Text(
                                  '',
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
                        Shimmer.fromColors(
                          baseColor: MyColors.red,
                          highlightColor: MyColors.red.withAlpha(100),
                          child: Container(
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
                                          '',
                                          style: TextStyles.white14.copyWith(
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: SizedBox(
                                            height: height * 0.07,
                                            child:
                                                const CircularProgressIndicator()),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                        Shimmer.fromColors(
                          baseColor: MyColors.blue,
                          highlightColor: MyColors.blue.withAlpha(100),
                          child: Container(
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
                                        child: SizedBox(
                                            height: height * 0.07,
                                            child:
                                                const CircularProgressIndicator()),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          '',
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
          ],
        ),
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
