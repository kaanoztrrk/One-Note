import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Device/device_utility.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/appbar/appbar_action_buttons/action_button.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';
import 'package:one_note/featured/note/widget/date_selected_button.dart';

import '../../../common/widget/button/classic_button.dart';
import '../widget/category_tag_widget.dart';
import '../widget/task_plugin.dart';

class CreateTaskView extends StatelessWidget {
  const CreateTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Padding(
        padding: const EdgeInsets.all(ViSizes.defaultSpace),
        child: Column(
          children: [
            const ViTitle(title: "New Tasks", bigFont: true),
            const SizedBox(height: ViSizes.spaceBtwItems),
            ViContainer(
              heigth: 60,
              padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
              child: TextField(
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
            DateSelectedButton(),
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
                  hintText: "Add your task detailes",
                  hintStyle: ViTextTheme.ligthTextTheme.titleMedium
                      ?.copyWith(color: AppColors.darkerGrey),
                ),
              ),
            ),
            const SizedBox(height: ViSizes.spaceBtwItems / 2),
            const ViTaskPluginWidget(),
            const CategoryWidget(
              categoryName: 'Fruits',
              tags: ["fdf", "gdrg"],
            ),
            Spacer(),
            ViClassicButton(
              title: "Create Task",
              heigth: ViDeviceUtils.getScreenHeigth(context) * 0.08,
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
        AppBarActionButton(
          icon: Iconsax.search_normal,
          onTap: () => context.pop(),
        ),
      ],
    );
  }
}
