import 'package:equatable/equatable.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';

import '../../data/src/model/category_model/category_model.dart';

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

class LoadCategoriesEvent extends HomeEvent {}

class CreateCategoryEvent extends HomeEvent {
  final String title;
  final String subTitle;
  final List<Task> checkList;
  final List<String> tagList;
  final double isCompletedValue;

  const CreateCategoryEvent({
    required this.title,
    required this.subTitle,
    required this.checkList,
    required this.tagList,
    required this.isCompletedValue,
  });
}

class DeleteCategoryEvent extends HomeEvent {
  final CategoryModel category;

  const DeleteCategoryEvent({required this.category});
}

class UpdateCategoryEvent extends HomeEvent {
  final CategoryModel oldCategory;
  final CategoryModel newCategory;

  const UpdateCategoryEvent({required this.oldCategory, required this.newCategory});
}

class ChangeCheckBoxEvent extends HomeEvent {
  final bool isChecked;
  final Task task;

  const ChangeCheckBoxEvent({
    required this.isChecked,
    required this.task,
  });
}
