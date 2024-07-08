import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/core/locator/locator.dart';
import 'package:one_note/view/home_view/home_view.dart';
import 'package:one_note/view/search_view/search_view.dart';
import '../blocs/one_note/one_note_bloc.dart';
import '../common/bottom_navigator/bottom_navigator.dart';
import 'todo_task_view/todo_task_view.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Widget> _pages = [
    const HomeView(),
    BlocProvider.value(
      value: getIt<TaskBloc>(),
      child: const SearchPage(),
    ),
    BlocProvider.value(
      value: getIt<TaskBloc>(),
      child: const TodoTaskView(),
    ),
    const Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(context),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildPage(BuildContext context) {
    final state = context.watch<OneNoteBloc>().state;

    if (state is TabChangedState) {
      return _pages[state.tabIndex];
    } else {
      return _pages[0];
    }
  }
}
