part of 'one_note_bloc.dart';

abstract class OneNoteEvent extends Equatable {
  const OneNoteEvent();

  @override
  List<Object> get props => [];
}

class ChangeTab extends OneNoteEvent {
  final int tabIndex;

  const ChangeTab(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
