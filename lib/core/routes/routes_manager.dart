import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/core/routes/routes.dart';
import 'package:one_note/blocs/home_bloc/home_bloc.dart';
import 'package:one_note/data/repositories/firebase_user_repository.dart';
import 'package:one_note/data/src/model/category_model/category_model.dart';
import 'package:one_note/view/auth_view/sign_up_view.dart';
import 'package:one_note/view/create_task_view/create_task_main_view.dart';
import 'package:one_note/view/main_navigator.dart';
import 'package:one_note/view/task_detail_view/task_detail_view.dart';

import '../../view/home_view/home_view.dart';
import '../locator/locator.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MainNavigator(FirebaseUserRepo());
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
          value: getIt<HomeBloc>(),
          child: const HomeView(),
        );
      },
    ),
    GoRoute(
      path: Routes.create_task,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider.value(
          value: getIt<HomeBloc>(),
          child: const CreateTaskMainView(),
        );
      },
    ),
    GoRoute(
      path: Routes.task_detail,
      builder: (BuildContext context, GoRouterState state) {
        final category = state.extra as CategoryModel;
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<HomeBloc>()),
            BlocProvider.value(value: getIt<TaskBloc>()),
          ],
          child: TaskDetailView(category: category),
        );
      },
    ),
    GoRoute(
      path: Routes.register_view,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpScreen();
      },
    ),
  ],
);
