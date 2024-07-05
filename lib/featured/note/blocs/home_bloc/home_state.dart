import 'package:equatable/equatable.dart';
import '../../model/category_model/category_model.dart';
import '../../../../Util/Constant/enums.dart';

class HomeState extends Equatable {
  final List<ProgressStatus> status;
  final bool switchCreateTaskView;

  const HomeState({
    required this.status,
    required this.switchCreateTaskView,
  });

  factory HomeState.initial() {
    return HomeState(
      status: const [],
      switchCreateTaskView: false,
    );
  }

  HomeState copyWith({
    List<ProgressStatus>? status,
    bool? switchCreateTaskView,
  }) {
    return HomeState(
      status: status ?? this.status,
      switchCreateTaskView: switchCreateTaskView ?? this.switchCreateTaskView,
    );
  }

  @override
  List<Object?> get props => [status, switchCreateTaskView];
}
