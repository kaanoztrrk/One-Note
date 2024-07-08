import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Device/device_utility.dart';
import 'package:one_note/common/style/container_style.dart';
import 'package:one_note/common/widget/button/classic_button.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';
import 'package:one_note/core/locator/locator.dart';
import 'package:one_note/core/routes/routes_manager.dart';
import 'package:one_note/blocs/task_bloc/task_bloc.dart';
import 'package:one_note/blocs/task_bloc/task_event.dart';
import 'package:one_note/blocs/task_bloc/task_state.dart';

import '../../Util/Loader/vi_loader.dart';
import '../../Util/Theme/Custom_Themes.dart/text_theme.dart';

import 'widget/selected_color.dart';
import 'widget/task_plugin.dart';

class CreateToDoTaskView extends StatefulWidget {
  const CreateToDoTaskView({super.key});

  @override
  _CreateToDoTaskViewState createState() => _CreateToDoTaskViewState();
}

class _CreateToDoTaskViewState extends State<CreateToDoTaskView> {
  TextEditingController titleController = TextEditingController();
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: BlocProvider.value(
          value: getIt<TaskBloc>(),
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return Column(
                children: [
                  const ViTitle(
                    title: "New Tasks",
                    isBigFont: true,
                  ),
                  const SizedBox(height: ViSizes.spaceBtwItems),
                  ViContainer(
                    heigth: 60,
                    padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
                    child: TextField(
                      controller: titleController,
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
                  const SizedBox(height: ViSizes.spaceBtwItems),
                  ViContainer(
                    heigth: 150,
                    padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Add task details",
                        hintStyle: ViTextTheme.ligthTextTheme.titleMedium
                            ?.copyWith(color: AppColors.darkerGrey),
                      ),
                    ),
                  ),
                  const SizedBox(height: ViSizes.spaceBtwItems / 2),
                  const ViTaskPluginWidget(),
                  ViSelectedColor(
                    onColorSelected: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                  ),
                  const Spacer(),
                  ViClassicButton(
                    title: "Create Task",
                    heigth: ViDeviceUtils.getScreenHeigth(context) * 0.08,
                    onTap: () {
                      if (titleController.text.isEmpty) {
                        ViLoaders().showWarningMessage(
                            context, "Task title cannot be empty.");
                      } else if (selectedColor == null) {
                        ViLoaders().showWarningMessage(
                            context, "Please select a color.");
                      } else {
                        BlocProvider.of<TaskBloc>(context).add(
                          CreateToDoEvent(
                            title: titleController.text,
                            taskBgColor: selectedColor!.value,
                          ),
                        );
                        ViLoaders().showSuccessMessage(
                            context, "Task created successfully.");
                        router.pop();
                        ViDeviceUtils.hideKeyboard(context);
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
