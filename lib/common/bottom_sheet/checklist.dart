import 'package:flutter/material.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';

import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Device/device_utility.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

import 'package:one_note/common/style/container_style.dart';
import 'package:one_note/common/widget/button/classic_button.dart';

class AddCheckListBottomSheet {
  static void showAddTasksBottomSheet({
    required BuildContext context,
    required List<Task> checkList,
    required Function(List<Task>) onTagsUpdated,
  }) {
    final TextEditingController titleController = TextEditingController();

    showModalBottomSheet(
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
                ViContainer(
                  heigth: 60, // düzeltildi
                  padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Add Task Title",
                      hintStyle: ViTextTheme.ligthTextTheme.titleMedium
                          ?.copyWith(color: AppColors.darkerGrey),
                    ),
                  ),
                ),
                const SizedBox(height: ViSizes.sm),
                ViClassicButton(
                  title: "Add Task",
                  onTap: () {
                    if (titleController.text.isNotEmpty) {
                      Task newTask = Task(
                        title: titleController.text,
                        isChecked: false,
                        bgColor:
                            AppColors.grey.value, // Default background color
                      );
                      checkList.add(newTask);
                      onTagsUpdated(checkList);
                      Navigator.pop(context);
                    }
                  },
                  heigth: ViDeviceUtils.getScreenHeigth(context) * 0.08,
                ),
                const SizedBox(height: ViSizes.sm),
              ],
            ),
          ),
        );
      },
    );
  }
}
