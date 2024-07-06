import 'package:equatable/equatable.dart';
import '../../model/category_model/category_model.dart';
import '../../Util/Constant/enums.dart';

class HomeState extends Equatable {
  final List<ProgressStatus> status;
  final bool switchCreateTaskView;
  final List<CategoryModel> categoryList;

  const HomeState({
    required this.status,
    required this.switchCreateTaskView,
    required this.categoryList,
  });

  factory HomeState.initial() {
    return HomeState(
      status: const [],
      switchCreateTaskView: false,
      categoryList: [],
    );
  }

  HomeState copyWith({
    List<ProgressStatus>? status,
    bool? switchCreateTaskView,
    final List<CategoryModel>? categoryList,
  }) {
    return HomeState(
      status: status ?? this.status,
      switchCreateTaskView: switchCreateTaskView ?? this.switchCreateTaskView,
      categoryList: categoryList ?? this.categoryList,
    );
  }

  @override
  List<Object?> get props => [status, switchCreateTaskView, categoryList];
}
