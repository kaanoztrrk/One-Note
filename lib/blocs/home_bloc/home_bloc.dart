import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';
import '../../Util/Constant/enums.dart';
import '../../data/src/model/category_model/category_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Box<CategoryModel> categoryBox;
  final Box<Task> checkListTaskBox;

  HomeBloc({required this.categoryBox, required this.checkListTaskBox})
      : super(HomeState.initial()) {
    on<LoadProgressStatuses>(getStatus);
    on<ToggleSwitchCreateTaskView>(_switchToggleTaskView);
    on<LoadCategoriesEvent>(_loadCategories);
    on<CreateCategoryEvent>(_createCategory);
    on<DeleteCategoryEvent>(_deleteCategory);
    on<UpdateCategoryEvent>(_updateCategory);

    add(LoadCategoriesEvent());
  }

  // Load progress statuses into state
  void getStatus(LoadProgressStatuses event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      status: const [
        ProgressStatus.completed,
        ProgressStatus.inProgress,
        ProgressStatus.ongoing,
        ProgressStatus.canceled,
      ],
    ));
  }

  // Toggle task view switch in state
  void _switchToggleTaskView(
      ToggleSwitchCreateTaskView event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      switchCreateTaskView: !state.switchCreateTaskView,
    ));
  }

  // Load categories into state
  void _loadCategories(LoadCategoriesEvent event, Emitter<HomeState> emit) {
    List<CategoryModel> categories = categoryBox.values.toList();
    emit(state.copyWith(categoryList: categories));
  }

  // Create a new category
  void _createCategory(CreateCategoryEvent event, Emitter<HomeState> emit) {
    List<CategoryModel> newCategoryList = List.from(state.categoryList);

    CategoryModel newCategory = CategoryModel(
      title: event.title,
      subTitle: event.subTitle,
      checkList: event.checkList,
      isCompletedValue: event.isCompletedValue,
      tagList: event.tagList,
    );

    newCategoryList.add(newCategory);
    categoryBox.add(newCategory); // Save category to Hive

    emit(state.copyWith(categoryList: newCategoryList));
  }

  // Delete a category
  void _deleteCategory(DeleteCategoryEvent event, Emitter<HomeState> emit) {
    List<CategoryModel> updatedCategoryList = List.from(state.categoryList);
    int categoryIndex = updatedCategoryList.indexOf(event.category);

    if (categoryIndex != -1) {
      updatedCategoryList.removeAt(categoryIndex);
      categoryBox.deleteAt(categoryIndex); // Delete category from Hive
    }

    emit(state.copyWith(categoryList: updatedCategoryList));
  }

  // Update a category
  void _updateCategory(UpdateCategoryEvent event, Emitter<HomeState> emit) {
    List<CategoryModel> updatedCategoryList = List.from(state.categoryList);
    int index = updatedCategoryList.indexOf(event.oldCategory);

    if (index != -1) {
      updatedCategoryList[index] = event.newCategory;
      categoryBox.putAt(index, event.newCategory); // Update category in Hive
    }

    emit(state.copyWith(categoryList: updatedCategoryList));
  }

  //* check list part
}
