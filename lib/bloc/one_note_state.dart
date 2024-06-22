part of 'one_note_bloc.dart';

abstract class OneNoteState extends Equatable {
  const OneNoteState();

  @override
  List<Object> get props => [];
}

class TabChangedState extends OneNoteState {
  final int tabIndex;

  const TabChangedState(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
