import 'package:equatable/equatable.dart';
import 'package:one_note/data/src/model/user_model/user_model.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpRequired extends SignUpEvent {
  final UserModel user;
  final String password;

  const SignUpRequired(this.user, this.password);
}
