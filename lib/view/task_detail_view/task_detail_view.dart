import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/blocs/home_bloc/home_bloc.dart';

import 'package:one_note/blocs/home_bloc/home_state.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';
import 'package:one_note/data/src/model/category_model/category_model.dart';

import 'package:one_note/view/create_task_view/widget/category_tag_widget.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Constant/sizes.dart';
import '../../common/widget/appbar/appbar.dart';
import '../../common/widget/appbar/appbar_action_buttons/action_button.dart';
import '../../common/widget/layout/list_layout.dart';
import '../../common/widget/tile/recend_todo_task.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _appbar(context),
          body: Padding(
            padding: const EdgeInsets.all(ViSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ViTitle(
                  title: category.title,
                  style: ViTextTheme.ligthTextTheme.headlineMedium,
                ),
                const SizedBox(height: ViSizes.spaceBtwItems),
                Text(
                  category.subTitle,
                  style: ViTextTheme.ligthTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary),
                ),
                const SizedBox(height: ViSizes.spaceBtwItems),
                CategoryWidget(
                  categoryName: "",
                  tags: category.tagList,
                  onTagsUpdated: (List<String> tags) {},
                ),
                const SizedBox(height: ViSizes.spaceBtwItems * 2),
                Expanded(
                  child: ViListLayout(
                    itemCount: category.checkList.length,
                    itemBuilder: (context, index) {
                      var task = category.checkList[index];
                      return RecendToDoTaskButton(
                        isCheck: task.isChecked,
                        text: task.title,
                        onDelete: () {},
                        onChanged: (isChecked) {},
                        onEdit: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ViAppBar _appbar(BuildContext context) {
    return ViAppBar(
      leadingWidget: AppBarActionButton(
        icon: Icons.clear,
        onTap: () => context.pop(),
      ),
      actions: [
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: ViSizes.lg, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.inProgress,
            borderRadius: BorderRadius.circular(ViSizes.borderRadiusSm),
          ),
          child: Text(
            "In Progress",
            style: ViTextTheme.ligthTextTheme.labelMedium
                ?.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
