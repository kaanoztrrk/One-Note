import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
