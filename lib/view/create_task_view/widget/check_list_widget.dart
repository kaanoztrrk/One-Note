// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/widget/tile/recend_todo_task.dart';

import 'package:one_note/common/widget/tile/vi_title.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';

import '../../../common/bottom_sheet/checklist.dart';

class CheckListWidget extends StatefulWidget {
  const CheckListWidget({
    super.key,
    this.categoryName,
    required this.checkList,
    this.extraWidget = false,
    required this.onTagsUpdated,
  });

  final String? categoryName;
  final bool? extraWidget;
  final List<Task> checkList;
  final Function(List<Task>) onTagsUpdated;

  @override
  _CheckListWidgetState createState() => _CheckListWidgetState();
}

class _CheckListWidgetState extends State<CheckListWidget> {
  late List<Task> _checkList;

  @override
  void initState() {
    super.initState();
    _checkList = List.from(widget.checkList);
  }

  void _updateCheckList(List<Task> updatedCheckList) {
    setState(() {
      _checkList = updatedCheckList;
    });
    widget.onTagsUpdated(updatedCheckList);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViTitle(
          title: widget.categoryName ?? "",
          widget: widget.extraWidget,
          buttonText: "Add",
          onTap: () => AddCheckListBottomSheet.showAddTasksBottomSheet(
            context: context,
            checkList: _checkList,
            onTagsUpdated: _updateCheckList,
          ),
        ),
        if (_checkList.isEmpty)
          Center(
            child: Text(
              "No Tasks...",
              style: ViTextTheme.ligthTextTheme.bodyLarge
                  ?.apply(color: AppColors.grey),
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: _checkList.length,
              itemBuilder: (context, index) {
                return RecendToDoTaskButton(
                  text: _checkList[index].title,
                  isCheck: false,
                );
              },
            ),
          ),
      ],
    );
  }
}
