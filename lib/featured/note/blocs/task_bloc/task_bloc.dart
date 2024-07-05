import 'package:bloc/bloc.dart';
import 'package:one_note/featured/note/model/task_model/task_model.dart';

import '../../model/category_model/category_model.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initial()) {
    on<CreateToDoEvent>(_createTask);
    on<ChangeCheckBoxEvent>(changeChackBox);
    on<CreateCategoryEvent>(_createCategory);
  }

  void _createCategory(CreateCategoryEvent event, Emitter<TaskState> emit) {
    List<CategoryModel> newCategoryList = List.from(state.categoryList);

    CategoryModel newCategory = CategoryModel(
        title: event.title,
        subTitle: event.subTitle,
        checkList: event.checkList,
        isCompletedValue: event.isComplated,
        tagList: event.tagList);

    newCategoryList.add(newCategory);

    emit(state.copyWith(categoryList: newCategoryList));
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
