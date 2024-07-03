import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/layout/list_layout.dart';
import 'package:one_note/featured/note/view/task_detail/widget/recend_todo_task.dart';

import '../../../../common/widget/empty_screen/empty_screen.dart';
import '../../../../core/locator/locator.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../../blocs/task_bloc/task_event.dart';
import '../../blocs/task_bloc/task_state.dart';

class TodoTaskView extends StatelessWidget {
  const TodoTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const ViAppBar(
        centerTitle: true,
        title: Text("To-Do Tasks"),
      ),
      body: BlocProvider.value(
        value: getIt<TaskBloc>(),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: ViSizes.defaultSpace / 2),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state.todoList.isEmpty) {
                return const ViEmptyScreen();
              }
              return ViListLayout(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  var task = state.todoList[index];
                  return RecendToDoTaskButton(
                      bgColor: task.bgColor,
                      isCheck: state.isChecked,
                      text: task.title,
                      onChanged: (isChecked) {
                        BlocProvider.of<TaskBloc>(context).add(
                          ChangeCheckBoxEvent(
                            isChecked: isChecked!,
                          ),
                        );
                      });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
