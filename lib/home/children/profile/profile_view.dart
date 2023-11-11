import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/authentication/bloc/authentication_bloc.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/children/widgets/home_bottom_nav_bar.dart';
import 'package:mobile/home/children/widgets/my_appbar.dart';
import 'package:mobile/utils/text_styles.dart';
import 'package:models/models.dart';

import 'widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.user});

  final User user;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: myAppBar('Профиль'),
      body: Column(
        children: [
          ProfileHeader(
            user: user,
            height: height * 0.2,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: Column(
              children: [
                ListCard(
                  title: 'Ваши данные',
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
                          fixedSize: Size(width * 0.45, 60),
                          backgroundColor: MyColors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {},
                        child: Text(
                          'О приложении',
                          style: TextStyles.white16,
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width * 0.45, 60),
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
                          style: TextStyles.white16,
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
