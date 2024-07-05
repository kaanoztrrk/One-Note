import 'package:get_it/get_it.dart';
import 'package:one_note/featured/note/blocs/task_bloc/task_bloc.dart';

import '../../featured/note/blocs/home_bloc/home_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<TaskBloc>(() => TaskBloc());
  getIt.registerLazySingleton(() => HomeBloc());
}
