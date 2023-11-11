import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/authentication/authentication.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/home_bottom_nav_bar.dart';
import 'package:mobile/utils/text_styles.dart';

import 'widgets/widgets.dart';

class ProfileViewLoading extends StatelessWidget {
  const ProfileViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
      ),
      body: Column(
        children: [
          CardShimmer(width: width * 0.97, height: height * 0.2),
          SizedBox(height: height * 0.02),
          Expanded(
            child: Column(
              children: [
                ListCard(
                  title: 'Анкетные данные',
                  icon: MyAssets.images.yourData.svg(),
                  height: height * 0.09,
                ),
                ListCard(
                  title: 'Безопасность',
                  icon: MyAssets.images.security.svg(),
                  height: height * 0.09,
                ),
                ListCard(
                  title: 'Биометрия',
                  icon: MyAssets.images.biometry.svg(),
                  height: height * 0.09,
                ),
                ListCard(
                  title: 'Настройка уведомлений',
                  icon: MyAssets.images.notification.svg(),
                  height: height * 0.09,
                ),
                ListCard(
                  title: 'Помощь и поддержка',
                  icon: MyAssets.images.support.svg(),
                  height: height * 0.09,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.45, height * 0.07),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'О приложении',
                          style: TextStyles.black14,
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.45, height * 0.07),
                          backgroundColor: MyColors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(AuthenticationLogoutRequested());
                        },
                        child: Text(
                          'Выход',
                          style: TextStyles.white14,
                        ))
                  ],
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const HomeBottomNavBar(),
    );
  }
}
