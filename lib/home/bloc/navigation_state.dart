part of 'navigation_bloc.dart';

sealed class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

final class NavigationInitial extends NavigationState {}

final class ScheduleLoading extends NavigationState {
  const ScheduleLoading(this.user);
  final User user;
}

final class ScheduleLoaded extends NavigationState {
  const ScheduleLoaded(
      this.tasks, this.points, this.drivingSessionResults, this.user);
  final List<Task> tasks;
  final List<PlacemarkMapObject> points;
  final List<DrivingSessionResult> drivingSessionResults;
  final User user;
}

final class ScheduleFail extends NavigationState {}

final class TaskLoading extends NavigationState {}

final class TaskLoaded extends NavigationState {
  const TaskLoaded(this.task, this.points, this.drivingSessionResult);
  final Task task;
  final List<PlacemarkMapObject> points;
  final DrivingSessionResult drivingSessionResult;
}

final class TaskFail extends NavigationState {}

final class CommunityLoading extends NavigationState {
  const CommunityLoading(this.user);
  final User user;
}

final class CommunityLoaded extends NavigationState {
  const CommunityLoaded(this.user);
  final User user;
}

final class CommunityFail extends NavigationState {}

final class ProfileLoading extends NavigationState {}

final class ProfileLoaded extends NavigationState {
  const ProfileLoaded(this.user);
  final User user;
}

final class ProfileFail extends NavigationState {}
