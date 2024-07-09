import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_note/data/repositories/user_repo.dart';
import 'package:one_note/data/src/model/user_model/user_model.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>(_onSignUpRequired);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  Future<void> _onSignUpRequired(
      SignUpRequired event, Emitter<SignUpState> emit) async {
    emit(SignUpProcess());
    try {
      UserModel user = await _userRepository.signUp(event.user, event.password);
      await _userRepository.setUserData(user);
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure());
    }
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<SignUpState> emit) {
    final currentState = state;
    if (currentState is SignUpInitial) {
      emit(currentState.copyWith(
          obscurePassword: !currentState.obscurePassword));
    } else if (currentState is SignUpFailure) {
      emit(currentState.copyWith(
          obscurePassword: !currentState.obscurePassword));
    } else {
      emit(SignUpInitial(obscurePassword: true));
    }
  }
}
