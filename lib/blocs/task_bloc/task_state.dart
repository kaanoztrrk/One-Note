import 'package:equatable/equatable.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';

class TaskState extends Equatable {
  final List<Task> todoList;
  final List<Task> searchResults;
  final bool? isChecked;
  final int? taskBgColor;

  const TaskState({
    required this.todoList,
    required this.searchResults,
    this.isChecked,
    this.taskBgColor,
  });

  factory TaskState.initial() {
    return const TaskState(
      todoList: [],
      searchResults: [],
      isChecked: false,
      taskBgColor: 0xFFFFFFFF, // Varsayılan renk beyaz
    );
  }

  TaskState copyWith({
    List<Task>? todoList,
    List<Task>? searchResults,
    bool? isChecked,
    int? taskBgColor,
  }) {
    return TaskState(
      todoList: todoList ?? this.todoList,
      searchResults: searchResults ?? this.searchResults,
      isChecked: isChecked ?? this.isChecked,
      taskBgColor: taskBgColor ?? this.taskBgColor,
    );
  }

  @override
  List<Object?> get props => [todoList, searchResults, isChecked, taskBgColor];
}
