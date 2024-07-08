import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/blocs/auth_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:one_note/view/auth_view/welcome_view.dart';
import 'package:one_note/view/main_view.dart';

import '../blocs/auth_blocs/authentication_bloc/authentication_state.dart';
import '../blocs/one_note/one_note_bloc.dart';
import '../data/repositories/user_repo.dart';

class MainNavigator extends StatelessWidget {
  final UserRepository userRepository;
  const MainNavigator(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticated) {
            return BlocProvider(
              create: (context) => OneNoteBloc(),
              child: MainView(),
            );
          } else {
            return const WelcomeScreen();
          }
        },
      ),
    );
  }
}
