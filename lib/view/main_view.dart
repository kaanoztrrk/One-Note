import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/blocs/home_bloc/home_bloc.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/core/locator/locator.dart';
import 'package:one_note/view/home_view/home_view.dart';
import 'package:one_note/view/search_view/search_view.dart';
import '../Util/Constant/colors.dart';
import '../blocs/one_note/one_note_bloc.dart';
import '../common/bottom_navigator/bottom_navigator.dart';
import '../core/routes/routes.dart';

class MainView extends StatelessWidget {
  MainView({super.key});

  final List<Widget> _pages = [
    BlocProvider.value(
      value: getIt<HomeBloc>(),
      child: const HomeView(),
    ),
    BlocProvider.value(
      value: getIt<TaskBloc>(),
      child: const SearchPage(),
    ),
    Container()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(context),
      floatingActionButton: SizedBox(
        height: 56.0,
        width: 56.0,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => context.push(Routes.create_task),
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
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
