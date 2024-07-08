import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:one_note/Util/Constant/image_strings.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/common/style/container_style.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/empty_screen/empty_screen.dart';
import 'package:one_note/common/widget/tile/recend_todo_task.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Constant/sizes.dart';
import '../../Util/Theme/Custom_Themes.dart/text_theme.dart';
import '../../blocs/task_bloc/task_event.dart';
import '../../blocs/task_bloc/task_state.dart';
import '../../common/bottom_sheet/on_edit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ViAppBar(
        centerTitle: true,
        title: Text("To-Do Task Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ViSizes.defaultSpace / 2),
        child: Column(
          children: [
            ViContainer(
              margin: const EdgeInsets.only(top: ViSizes.sm),
              heigth: 60,
              padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
              child: TextField(
                onChanged: (query) {
                  BlocProvider.of<TaskBloc>(context)
                      .add(SearchTasksEvent(query));
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Task Title",
                  hintStyle: ViTextTheme.ligthTextTheme.titleMedium
                      ?.copyWith(color: AppColors.darkerGrey),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  if (state.searchResults.isEmpty) {
                    return ViEmptyScreen(
                        image: ViImages().emtySearchScreen,
                        title: 'Search Results Empty',
                        subtitle:
                            "No items matched your search. Try a broader search.");
                  } else {
                    return ListView.builder(
                      itemCount: state.searchResults.length,
                      itemBuilder: (context, index) {
                        var task = state.searchResults[index];

                        return RecendToDoTaskButton(
                          bgColor: task.isChecked
                              ? AppColors.softGrey
                              : Color(task.bgColor),
                          doneActionButton: true,
                          disableCheckBox: true,
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
                          onDone: () {
                            BlocProvider.of<TaskBloc>(context).add(
                              ChangeCheckBoxEvent(
                                isChecked: true,
                                task: task,
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
