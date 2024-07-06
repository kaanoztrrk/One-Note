import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/model/category_model/category_model.dart';

import '../../blocs/home_bloc/home_bloc.dart';
import '../../model/task_model/task_model.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<TaskBloc>(() => TaskBloc());
  getIt.registerSingleton<HomeBloc>(
    HomeBloc(
      categoryBox: Hive.box<CategoryModel>('categories'),
    ),
  );
}
