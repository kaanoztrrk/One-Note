import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/core/routes/routes.dart';
import 'package:one_note/featured/note/blocs/home_bloc/home_bloc.dart';
import 'package:one_note/featured/note/model/category_model/category_model.dart';
import 'package:one_note/featured/note/view/create_task/create_task_main_view.dart';
import 'package:one_note/featured/note/view/main_view.dart';
import 'package:one_note/featured/note/view/task_detail/task_detail_view.dart';

import '../../bloc/one_note_bloc.dart';
import '../../featured/note/blocs/home_bloc/home_event.dart';
import '../../featured/note/blocs/task_bloc/task_bloc.dart';
import '../../featured/note/view/home/home_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => OneNoteBloc(),
          child: const MainView(),
        );
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => HomeBloc()..add(LoadProgressStatuses()),
          child: const HomeView(),
        );
      },
    ),
    GoRoute(
      path: Routes.create_task,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => HomeBloc(),
          child: const CreateTaskMainView(),
        );
      },
    ),
    GoRoute(
      path: Routes.task_detail,
      builder: (BuildContext context, GoRouterState state) {
        final category = state.extra as CategoryModel;
        return BlocProvider(
          create: (context) => TaskBloc(),
          child: TaskDetailView(category: category),
        );
      },
    ),
  ],
);
