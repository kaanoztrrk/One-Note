import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Util/Constant/enums.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<LoadProgressStatuses>(getStatus);
    on<ToggleSwitchCreateTaskView>(_switchToggleTaskView);
  }

  getStatus(LoadProgressStatuses event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      status: const [
        ProgressStatus.completed,
        ProgressStatus.inProgress,
        ProgressStatus.ongoing,
        ProgressStatus.canceled,
      ],
    ));
  }

  void _switchToggleTaskView(
      ToggleSwitchCreateTaskView event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      switchCreateTaskView: !state.switchCreateTaskView,
    ));
  }
}
