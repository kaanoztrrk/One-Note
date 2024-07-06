import 'package:equatable/equatable.dart';
import 'package:one_note/model/task_model/task_model.dart';

import '../../model/category_model/category_model.dart';

class TaskState extends Equatable {
  final List<Task> todoList;

  final bool? isChecked;
  final int? taskBgColor;

  TaskState({
    required this.todoList,
    this.isChecked,
    this.taskBgColor,
  });

  factory TaskState.initial() {
    return TaskState(
      todoList: [],

      isChecked: false,
      taskBgColor: 0xFFFFFFFF, // Varsayılan renk beyaz
    );
  }

  TaskState copyWith({
    List<Task>? todoList,
    List<CategoryModel>? categoryList,
    bool? isChecked,
    int? taskBgColor,
  }) {
    return TaskState(
      todoList: todoList ?? this.todoList,
      isChecked: isChecked ?? this.isChecked,
      taskBgColor: taskBgColor ?? this.taskBgColor,
    );
  }

  @override
  List<Object?> get props => [todoList, isChecked, taskBgColor];
}
