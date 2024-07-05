// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../Util/Device/device_utility.dart';
import '../../../../Util/Theme/Custom_Themes.dart/text_theme.dart';
import '../../../../common/style/container/container_style.dart';
import '../../../../common/widget/button/classic_button.dart';
import '../../../../common/widget/tile/vi_title.dart';
import '../../../../core/locator/locator.dart';
import '../../../../core/routes/routes_manager.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../../blocs/task_bloc/task_event.dart';
import '../../blocs/task_bloc/task_state.dart';
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
                        hintText: "I Task Title",
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
                        hintText: "Add your task details",
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
                      BlocProvider.of<TaskBloc>(context).add(
                        CreateToDoEvent(
                          title: titleController.text,
                          taskBgColor: selectedColor,
                        ),
                      );
                      router.pop();
                      ViDeviceUtils.hideKeyboard(context);
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
