import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/gen/assets.gen.dart';
import 'package:mobile/gen/colors.gen.dart';
import 'package:mobile/home/bloc/navigation_bloc.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeNavigationBloc = context.read<NavigationBloc>();
    final currentIndex = homeNavigationBloc.currentIndex;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: MyColors.red,
      unselectedItemColor: MyColors.blue,
      showUnselectedLabels: true,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: currentIndex == 0
              ? MyAssets.images.scheduleOn.svg()
              : MyAssets.images.schedule.svg(),
          label: 'Расписание',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 1
              ? MyAssets.images.taskOn.svg()
              : MyAssets.images.task.svg(),
          label: 'Задача',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 2
              ? MyAssets.images.communityOn.svg()
              : MyAssets.images.community.svg(),
          label: 'Сообщество',
        ),
        BottomNavigationBarItem(
          icon: currentIndex == 3
              ? MyAssets.images.profileOn.svg()
              : MyAssets.images.profile.svg(),
          label: 'Профиль',
        ),
      ],
      onTap: (index) {
        homeNavigationBloc.add(PageTapped(index));
      },
    );
  }
}
