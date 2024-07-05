import 'package:equatable/equatable.dart';
import 'package:one_note/featured/note/model/task_model/task_model.dart';

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
