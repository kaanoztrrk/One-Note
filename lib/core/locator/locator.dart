import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_note/blocs/auth_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:one_note/blocs/auth_blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/data/repositories/user_repo.dart';
import 'package:one_note/data/src/model/category_model/category_model.dart';
import 'package:one_note/blocs/auth_blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:one_note/blocs/home_bloc/home_bloc.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';

import '../../data/repositories/firebase_user_repository.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<UserRepository>(() => FirebaseUserRepo());

  getIt.registerLazySingleton<AuthenticationBloc>(
    () => AuthenticationBloc(
      userRepository: getIt<UserRepository>(),
    ),
  );
  getIt.registerLazySingleton<SignInBloc>(
    () => SignInBloc(
      userRepository: getIt<UserRepository>(),
    ),
  );
  getIt.registerLazySingleton<SignUpBloc>(
    () => SignUpBloc(
      userRepository: getIt<UserRepository>(),
    ),
  );

  getIt.registerLazySingleton<TaskBloc>(
    () => TaskBloc(),
  );

  getIt.registerSingleton<HomeBloc>(
    HomeBloc(
      categoryBox: Hive.box<CategoryModel>('categories'),
      checkListTaskBox: Hive.box<Task>('checkListTasks'),
    ),
  );
}
