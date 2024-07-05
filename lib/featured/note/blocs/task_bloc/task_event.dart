import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/task_model/task_model.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateToDoEvent extends TaskEvent {
  final String title;
  final Color? taskBgColor;

  const CreateToDoEvent({
    required this.title,
    this.taskBgColor,
  });
}

class ChangeCheckBoxEvent extends TaskEvent {
  final bool isChecked;
  const ChangeCheckBoxEvent({required this.isChecked});
}

class CreateCategoryEvent extends TaskEvent {
  final String title;
  final String subTitle;
  final List<Task> checkList;
  final List<String> tagList;
  final double isComplated;

  const CreateCategoryEvent({
    required this.title,
    required this.subTitle,
    required this.checkList,
    required this.isComplated,
    required this.tagList,
  });
}
