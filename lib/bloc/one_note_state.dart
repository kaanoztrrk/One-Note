part of 'one_note_bloc.dart';

sealed class OneNoteState extends Equatable {
  const OneNoteState();
  
  @override
  List<Object> get props => [];
}

final class OneNoteInitial extends OneNoteState {}
