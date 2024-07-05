// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/featured/note/model/task_model/task_model.dart';

import '../../model/category_model/category_model.dart';

class TaskState extends Equatable {
  List<Task> todoList;
  Color? taskBgColor;
  final List<Color> taskColorList;
  final List<CategoryModel> categoryList;
  bool isChecked;

  TaskState(
      {required this.categoryList,
      required this.todoList,
      required this.isChecked,
      required this.taskColorList,
      required this.taskBgColor});

  factory TaskState.initial() {
    return TaskState(
      isChecked: false,
      todoList: const [],
      taskColorList: const [],
      taskBgColor: AppColors.textWhite,
      categoryList: [],
    );
  }

  TaskState copyWith({
    bool? isChecked,
    List<Task>? todoList,
    List<Color>? taskColorList,
    Color? taskBgColor,
    List<CategoryModel>? categoryList,
  }) {
    return TaskState(
        isChecked: isChecked ?? this.isChecked,
        todoList: todoList ?? this.todoList,
        taskColorList: taskColorList ?? this.taskColorList,
        taskBgColor: taskBgColor ?? this.taskBgColor,
        categoryList: categoryList ?? this.categoryList);
  }

  @override
  List<Object?> get props =>
      [isChecked, todoList, taskColorList, taskBgColor, categoryList];
}
