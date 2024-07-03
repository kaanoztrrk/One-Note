import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCategoryEvent extends HomeEvent {
  const GetCategoryEvent();
}

class LoadTasksEvent extends HomeEvent {}

class LoadProgressStatuses extends HomeEvent {}

class ToggleSwitchCreateTaskView extends HomeEvent {}
