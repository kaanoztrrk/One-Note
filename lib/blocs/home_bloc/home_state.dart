import 'package:equatable/equatable.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';
import '../../data/src/model/category_model/category_model.dart';
import '../../Util/Constant/enums.dart';

class HomeState extends Equatable {
  final List<ProgressStatus> status;
  final bool switchCreateTaskView;
  final List<CategoryModel> categoryList;
  final List<Task> checkList;

  const HomeState({
    required this.status,
    required this.switchCreateTaskView,
    required this.categoryList,
    required this.checkList,
  });

  factory HomeState.initial() {
    return const HomeState(
      status: [],
      switchCreateTaskView: false,
      categoryList: [],
      checkList: [],
    );
  }

  HomeState copyWith({
    List<ProgressStatus>? status,
    bool? switchCreateTaskView,
    final List<CategoryModel>? categoryList,
    final List<Task>? checkList,
  }) {
    return HomeState(
      status: status ?? this.status,
      switchCreateTaskView: switchCreateTaskView ?? this.switchCreateTaskView,
      categoryList: categoryList ?? this.categoryList,
      checkList: checkList ?? this.checkList,
    );
  }

  @override
  List<Object?> get props =>
      [status, switchCreateTaskView, categoryList, checkList];
}
