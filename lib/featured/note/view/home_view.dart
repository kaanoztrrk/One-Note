import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Constant/text_strings.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/layout/grid_layout.dart';
import 'package:one_note/common/widget/layout/list_layout.dart';
import 'package:one_note/featured/note/bloc/home_bloc.dart';

import '../../../common/widget/appbar/appbar_action_buttons/action_button.dart';
import '../../../common/widget/tile/vi_title.dart';
import '../bloc/home_state.dart';
import '../widget/profile_Image_chip.dart';
import '../widget/progress_category_button.dart';
import '../widget/recend_task_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppbar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(ViSizes.defaultSpace),
            child: Column(
              children: [
                ViGridLayout(
                  mainAxisExtent: 90,
                  itemCount: state.status.length,
                  itemBuilder: (context, index) {
                    return ViProgressCategoryButton(
                      status: state.status[index],
                    );
                  },
                ),
                const SizedBox(height: ViSizes.spaceBtwSections),
                const ViTitle(title: ViTexts.recendTask),
                Expanded(
                  child: ViListLayout(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const RecendTaskButton();
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  ViAppBar _homeAppbar() {
    return ViAppBar(
      leadingWidget: const ProfileImageChip(),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${ViTexts.hi} Kaan 👋",
            style: ViTextTheme.ligthTextTheme.headlineMedium,
          ),
          Text(
            ViTexts.appbarSubTitle,
            style: ViTextTheme.ligthTextTheme.titleSmall?.copyWith(
                color: AppColors.textSecondary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: const [
        AppBarActionButton(icon: Iconsax.category),
      ],
    );
  }
}
