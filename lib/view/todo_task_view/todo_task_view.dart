import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/layout/list_layout.dart';
import 'package:one_note/common/widget/tile/recend_todo_task.dart';
import 'package:one_note/core/locator/locator.dart';

import '../../common/widget/empty_screen/empty_screen.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../../blocs/task_bloc/task_event.dart';
import '../../blocs/task_bloc/task_state.dart';
import '../../model/task_model/task_model.dart';

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
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: ViSizes.defaultSpace / 2),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            //
            if (state.todoList.isEmpty) {
              return const ViEmptyScreen(spacer: true);
            }
            return ViListLayout(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                var task = state.todoList[index];
                return RecendToDoTaskButton(
                  bgColor: Color(task.bgColor),
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
                    showPopup(
                        context, task, BlocProvider.of<TaskBloc>(context));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  showPopup(
    BuildContext context,
    Task task,
    TaskBloc bloc,
  ) {
    final TextEditingController controller =
        TextEditingController(text: task.title);
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: "Edit Task",
                  ),
                ),
                const SizedBox(height: ViSizes.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        final updatedTask = Task(
                          title: controller.text,
                          isChecked: task.isChecked,
                          bgColor: task.bgColor,
                        );
                        bloc.add(
                          UpdateToDoEvent(
                            oldTask: task,
                            newTask: updatedTask,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
