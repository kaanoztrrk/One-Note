// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/view/create_task_view/create_category_view.dart';
import 'package:one_note/view/create_task_view/create_todo_view.dart';

import '../../common/widget/appbar/appbar_action_buttons/action_button.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import '../../blocs/home_bloc/home_event.dart';
import '../../blocs/home_bloc/home_state.dart';

class CreateTaskMainView extends StatelessWidget {
  const CreateTaskMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: ViAppBar(
            centerTitle: true,
            leadingWidget: AppBarActionButton(
              icon: Icons.clear,
              onTap: () => context.pop(),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomToggleSwitch(
                  initialIndex: 0,
                  onChanged: (index) {
                    context.read<HomeBloc>().add(ToggleSwitchCreateTaskView());
                  },
                ),
              ],
              //  context.read<HomeBloc>().add(ToggleSwitchCreateTaskView());
            ),
            actions: [
              AppBarActionButton(
                icon: Iconsax.search_normal,
                onTap: () => context.pop(),
              ),
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return state.switchCreateTaskView
                  ? const CreateToDoTaskView()
                  : const CreateCategoryTaskView();
            },
          ),
        );
      },
    );
  }
}

class CustomToggleSwitch extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int initialIndex;
  final bool showCategory;

  const CustomToggleSwitch({
    super.key,
    required this.onChanged,
    this.initialIndex = 0,
    this.showCategory = true,
  });

  @override
  _CustomToggleSwitchState createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  late int _currentIndex;

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = 1 - _currentIndex; // Toggle index
          widget.onChanged.call(_currentIndex); // Notify parent widget
        });
      },
      child: Container(
        width: 180.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
          color: _currentIndex == 0 ? Colors.white : AppColors.buttonPrimary,
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  widget.showCategory && _currentIndex == 0 ? 'Tasks' : '',
                  style: TextStyle(
                    color: _currentIndex == 0 ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: 2.0,
              color: Colors.black,
            ),
            Expanded(
              child: Center(
                  child: Text(
                'To-Do',
                style: TextStyle(
                  color: _currentIndex == 1 ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
