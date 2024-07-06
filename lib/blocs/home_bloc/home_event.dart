import 'package:equatable/equatable.dart';
import 'package:one_note/model/task_model/task_model.dart';

import '../../model/category_model/category_model.dart';

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

  CreateCategoryEvent({
    required this.title,
    required this.subTitle,
    required this.checkList,
    required this.tagList,
    required this.isCompletedValue,
  });
}

class DeleteCategoryEvent extends HomeEvent {
  final CategoryModel category;

  DeleteCategoryEvent({required this.category});
}

class UpdateCategoryEvent extends HomeEvent {
  final CategoryModel oldCategory;
  final CategoryModel newCategory;

  UpdateCategoryEvent({required this.oldCategory, required this.newCategory});
}
