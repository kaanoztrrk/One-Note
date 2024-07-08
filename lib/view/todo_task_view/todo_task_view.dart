import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/common/bottom_sheet/on_edit.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/layout/list_layout.dart';
import 'package:one_note/common/widget/tile/recend_todo_task.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/blocs/task_bloc/task_event.dart';
import 'package:one_note/blocs/task_bloc/task_state.dart';

import '../../Util/Constant/image_strings.dart';
import '../../common/widget/empty_screen/empty_screen.dart';

class TodoTaskView extends StatelessWidget {
  const TodoTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ViAppBar(
        centerTitle: true,
        title: Text("To-Do Tasks"),
        actions: [],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: ViSizes.defaultSpace / 2),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state.todoList.isEmpty) {
              return ViEmptyScreen(
                spacer: true,
                showRotateArrow: true,
                image: ViImages().emtyScreen,
                title: "To-Do List Empty",
                subtitle: "You Can add a task from the button below",
              );
            }
            return ViListLayout(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                var task = state.todoList[index];
                return RecendToDoTaskButton(
                  bgColor:
                      task.isChecked ? AppColors.softGrey : Color(task.bgColor),
                  isCheck: task.isChecked,
                  text: task.title,
                  onChanged: (isChecked) {
                    BlocProvider.of<TaskBloc>(context).add(
                      ChangeCheckBoxEvent(
                        isChecked: isChecked!,
                        task: task,
                      ),
                    );
                  },
                  onDelete: () {
                    BlocProvider.of<TaskBloc>(context).add(
                      DeleteToDoEvent(task: task),
                    );
                  },
                  onEdit: () {
                    OnEditBottomSheet.onEditBottomSheet(
                      context: context,
                      task: task,
                      bloc: BlocProvider.of<TaskBloc>(context),
                    );
                  },
                  onDone: () {},
                );
              },
            );
          },
        ),
      ),
    );
  }
}
