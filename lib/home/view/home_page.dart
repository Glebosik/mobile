import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/home/bloc/navigation_bloc.dart';
import 'package:mobile/home/children/community/community.dart';
import 'package:mobile/home/children/community/community_fail.dart';
import 'package:mobile/home/children/community/community_loading.dart';
import 'package:mobile/home/children/profile/profile_view_fail.dart';
import 'package:mobile/home/children/profile/profile_view_loading.dart';
import 'package:mobile/home/children/schedule/schedule.dart';
import 'package:mobile/home/children/schedule/schedule_fail.dart';
import 'package:mobile/home/children/schedule/schedule_loading.dart';
import 'package:mobile/home/children/task/task.dart';
import 'package:mobile/home/children/profile/profile_view.dart';
import 'package:mobile/home/children/task/task_fail.dart';
import 'package:mobile/home/children/task/task_loading.dart';
import 'package:mobile/splash/splash.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        switch (state) {
          case NavigationInitial():
            return const SplashPage();
          case ScheduleLoading():
            return ScheduleViewLoading(user: state.user);
          case ScheduleLoaded():
            return ScheduleView(
              points: state.points,
              results: state.drivingSessionResults,
              user: state.user,
            );
          case ScheduleFail():
            return const ScheduleViewFail();
          case TaskLoading():
            return const TaskViewLoading();
          case TaskLoaded():
            return TaskView(
              task: state.task,
              points: state.points,
              drivingSessionResult: state.drivingSessionResult,
            );
          case TaskFail():
            return const TaskViewFail();
          case CommunityLoading():
            return CommunityViewLoading(user: state.user);
          case CommunityLoaded():
            return CommunityView(
              completedTasks: 221,
              place: 5,
              percent: 71,
              progress: 2,
              user: state.user,
              courses: 28,
              coursesTotal: 38,
              cards: 139,
              cardsTotal: 236,
            );
          case CommunityFail():
            return const CommunityViewFail();
          case ProfileLoading():
            return const ProfileViewLoading();
          case ProfileLoaded():
            return ProfileView(user: state.user);
          case ProfileFail():
            return const ProfileViewFail();
        }
      },
    );
  }
}
