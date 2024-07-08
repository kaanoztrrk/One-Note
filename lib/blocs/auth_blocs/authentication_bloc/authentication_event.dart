import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticaitonUserChanged extends AuthenticationEvent {
  final User? user;

  const AuthenticaitonUserChanged(this.user);
}
