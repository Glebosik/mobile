part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class PageTapped extends NavigationEvent {
  final int index;

  const PageTapped(this.index);
  @override
  List<Object> get props => [index];
}

class UpdateData extends NavigationEvent {
  final int index;

  const UpdateData(this.index);

  @override
  List<Object> get props => [index];
}

class FetchAllData extends NavigationEvent {}
