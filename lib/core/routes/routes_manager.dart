import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/core/routes/routes.dart';
import 'package:one_note/featured/note/bloc/home_bloc.dart';
import 'package:one_note/featured/note/view/create_task_view.dart';
import 'package:one_note/featured/note/view/main_view.dart';

import '../../bloc/one_note_bloc.dart';
import '../../featured/note/bloc/home_event.dart';
import '../../featured/note/view/home_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => OneNoteBloc(),
          child: MainView(),
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
          create: (context) => OneNoteBloc(),
          child: CreateTaskView(),
        );
      },
    ),
  ],
);
