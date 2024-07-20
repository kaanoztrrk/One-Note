import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';
import '../../Util/Constant/enums.dart';
import '../../data/src/model/category_model/category_model.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.categoryBox, required this.checkListTaskBox})
      : super(HomeState.initial()) {
    on<LoadProgressStatuses>(getStatus);
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
}
