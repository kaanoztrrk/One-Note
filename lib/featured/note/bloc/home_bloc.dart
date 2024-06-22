import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Util/Constant/enums.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadProgressStatuses>((event, emit) {
      emit(const HomeState(status: [
        ProgressStatus.completed,
        ProgressStatus.inProgress,
        ProgressStatus.ongoing,
        ProgressStatus.canceled,
      ]));
    });
  }
}
