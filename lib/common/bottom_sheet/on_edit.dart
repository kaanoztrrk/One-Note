import 'package:flutter/material.dart';
import 'package:one_note/data/src/model/task_model/task_model.dart';

import 'package:one_note/Util/Constant/sizes.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Device/device_utility.dart';
import '../../Util/Theme/Custom_Themes.dart/text_theme.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../../blocs/task_bloc/task_event.dart';
import '../style/container_style.dart';
import '../widget/button/classic_button.dart';

class OnEditBottomSheet {
  static void onEditBottomSheet({
    required BuildContext context,
    required Task task,
    required TaskBloc bloc,
  }) {
    final TextEditingController controller =
        TextEditingController(text: task.title);
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
                  heigth: 60,
                  padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: ViTextTheme.ligthTextTheme.titleMedium
                          ?.copyWith(color: AppColors.darkerGrey),
                    ),
                  ),
                ),
                const SizedBox(height: ViSizes.sm),
                ViClassicButton(
                  title: "Save",
                  heigth: ViDeviceUtils.getScreenHeigth(context) * 0.08,
                  onTap: () {
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
