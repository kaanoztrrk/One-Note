import 'package:equatable/equatable.dart';

import '../../data/src/model/task_model/task_model.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CreateToDoEvent extends TaskEvent {
  final String title;
  final int? taskBgColor;

  const CreateToDoEvent({required this.title, this.taskBgColor});
}

class ChangeCheckBoxEvent extends TaskEvent {
  final bool isChecked;
  final Task task;

  const ChangeCheckBoxEvent({
    required this.isChecked,
    required this.task,
  });
}

class DeleteToDoEvent extends TaskEvent {
  final Task task;

  const DeleteToDoEvent({required this.task});
}

class UpdateToDoEvent extends TaskEvent {
  final Task oldTask;
  final Task newTask;

  const UpdateToDoEvent({
    required this.oldTask,
    required this.newTask,
  });
}

class LoadTasksEvent extends TaskEvent {}

class SearchTasksEvent extends TaskEvent {
  final String query;

  const SearchTasksEvent(this.query);

  @override
  List<Object> get props => [query];
}
