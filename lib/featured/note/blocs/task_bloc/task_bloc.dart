import 'package:bloc/bloc.dart';
import 'package:one_note/featured/note/model/task_model/task_model.dart';

import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initial()) {
    on<CreateToDoEvent>(_createTask);
    on<ChangeCheckBoxEvent>(changeChackBox);
  }

  void _createTask(CreateToDoEvent event, Emitter<TaskState> emit) {
    List<Task> newTodoList = List.of(state.todoList);

    newTodoList.add(Task(
      title: event.title,
      bgColor: event.taskBgColor!,
    ));

    emit(
      state.copyWith(
        todoList: newTodoList,
        taskBgColor: event.taskBgColor,
      ),
    );
  }

  changeChackBox(
    ChangeCheckBoxEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(state.copyWith(
      isChecked: event.isChecked,
    ));
  }
}
