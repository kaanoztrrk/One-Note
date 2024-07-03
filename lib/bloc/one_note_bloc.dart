import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'one_note_event.dart';
part 'one_note_state.dart';

class OneNoteBloc extends Bloc<OneNoteEvent, OneNoteState> {
  OneNoteBloc() : super(const TabChangedState(0)) {
    on<ChangeTab>((event, emit) {
      emit(TabChangedState(event.tabIndex));
    });
  }
}
