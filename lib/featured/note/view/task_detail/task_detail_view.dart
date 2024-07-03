import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';
import 'package:one_note/featured/note/view/create_task/widget/category_tag_widget.dart';

import '../../../../Util/Constant/colors.dart';
import '../../../../Util/Constant/sizes.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/appbar/appbar_action_buttons/action_button.dart';
import '../../../../common/widget/layout/list_layout.dart';
import 'widget/recend_todo_task.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: Column(
          children: [
            ViTitle(
              title: "Web Site For Theviacoder",
              style: ViTextTheme.ligthTextTheme.headlineMedium,
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),
            Text(
              "Sint culpa do eu nisi. Anim non ad reprehenderit amet consectetur anim consectetur incididunt ex officia. Pariatur elit velit incididunt enim Lorem sit consectetur ea nisi laboris dolor. Fugiat est consectetur elit mollit cupidatat. Tempor ullamco eiusmod laboris mollit nulla proident. Occaecat sunt velit duis velit aliqua.",
              style: ViTextTheme.ligthTextTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.textSecondary),
            ),
            const CategoryWidget(
              categoryName: '',
              tags: [],
            ),
            const SizedBox(height: ViSizes.spaceBtwItems),
            const ViTitle(title: "Check List"),
            Expanded(
              child: ViListLayout(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const RecendToDoTaskButton(
                    text:
                        'dsds Officia labore et eiusmod mollit excepteur pariatur est cupidatat.',
                  );
                },
              ),
            ),
          ],
        ),
      ),
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
