import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Device/device_utility.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';
import 'package:one_note/core/routes/routes_manager.dart';
import 'package:one_note/featured/note/blocs/home_bloc/home_bloc.dart';
import 'package:one_note/featured/note/blocs/task_bloc/task_event.dart';
import 'package:one_note/core/locator/locator.dart';
import '../../../../common/widget/button/classic_button.dart';
import '../../blocs/home_bloc/home_state.dart';
import '../../blocs/task_bloc/task_bloc.dart';

import 'widget/category_tag_widget.dart';
import 'widget/task_plugin.dart';

class CreateCategoryTaskView extends StatefulWidget {
  const CreateCategoryTaskView({super.key});

  @override
  _CreateCategoryTaskViewState createState() => _CreateCategoryTaskViewState();
}

class _CreateCategoryTaskViewState extends State<CreateCategoryTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  List<String> _tags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: BlocProvider.value(
          value: getIt<TaskBloc>(),
          child: BlocBuilder<HomeBloc, HomeState>(
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
                      controller: subTitleController,
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
                  CategoryWidget(
                    categoryName: 'Categories',
                    extraWidget: true,
                    tags: [],
                    onTagsUpdated: (tags) {
                      setState(() {
                        _tags = tags;
                      });
                    },
                  ),
                  const Spacer(),
                  ViClassicButton(
                    title: "Create Task",
                    heigth: ViDeviceUtils.getScreenHeigth(context) * 0.08,
                    onTap: () {
                      print('Added Categories: $_tags');
                      BlocProvider.of<TaskBloc>(context).add(
                          CreateCategoryEvent(
                              title: titleController.text,
                              subTitle: subTitleController.text,
                              checkList: [],
                              isComplated: 0.0,
                              tagList: _tags));
                      router.pop();
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
