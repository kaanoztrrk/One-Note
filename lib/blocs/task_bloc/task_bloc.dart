import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final Box<Task> taskBox = Hive.box<Task>('tasks');

  TaskBloc() : super(TaskState.initial()) {
    on<CreateToDoEvent>(_createTask);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<DeleteToDoEvent>(_deleteTask);
    on<UpdateToDoEvent>(_updateTask);
    on<LoadTasksEvent>(_loadTasks);
    on<SearchTasksEvent>(_searchTasks);

    // Başlangıçta görevleri ve kategorileri yükle
    add(LoadTasksEvent());
  }

  void _createTask(CreateToDoEvent event, Emitter<TaskState> emit) {
    List<Task> newTodoList = List.of(state.todoList);

    Task newTask = Task(
      title: event.title,
      bgColor: event.taskBgColor!,
    );

    newTodoList.add(newTask);
    taskBox.add(newTask);

    emit(
      state.copyWith(
        todoList: newTodoList,
        taskBgColor: event.taskBgColor,
      ),
    );
  }

  void _deleteTask(DeleteToDoEvent event, Emitter<TaskState> emit) {
    List<Task> updatedTodoList = List.of(state.todoList);
    int taskIndex = updatedTodoList.indexOf(event.task);

    if (taskIndex != -1) {
      updatedTodoList.removeAt(taskIndex);
      taskBox.deleteAt(taskIndex);
    }

    emit(
      state.copyWith(
        todoList: updatedTodoList,
      ),
    );
  }

  void _updateTask(UpdateToDoEvent event, Emitter<TaskState> emit) {
    List<Task> updatedTodoList = List.of(state.todoList);
    int index = updatedTodoList.indexOf(event.oldTask);

    if (index != -1) {
      updatedTodoList[index] = event.newTask;
      taskBox.putAt(index, event.newTask);
    }

    emit(
      state.copyWith(
        todoList: updatedTodoList,
      ),
    );
  }

  void _changeCheckBox(ChangeCheckBoxEvent event, Emitter<TaskState> emit) {
    // Find the index of the task in the list
    int index = state.todoList.indexWhere((task) => task == event.task);

    if (index != -1) {
      // Create a copy of the task with updated isChecked value
      Task updatedTask = event.task.copyWith(isChecked: event.isChecked);

      // Replace the task at the found index with the updated task
      List<Task> updatedTodoList = List.from(state.todoList);
      updatedTodoList[index] = updatedTask;

      // Update the task in Hive storage
      taskBox.putAt(index, updatedTask);

      // Emit the updated state
      emit(state.copyWith(todoList: updatedTodoList));
    }
  }

  void _loadTasks(LoadTasksEvent event, Emitter<TaskState> emit) {
    List<Task> tasks = taskBox.values.toList();
    emit(state.copyWith(todoList: tasks));
  }

  void _searchTasks(SearchTasksEvent event, Emitter<TaskState> emit) {
    List<Task> searchResults = state.todoList
        .where((task) =>
            task.title.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(state.copyWith(searchResults: searchResults));
  }
}
