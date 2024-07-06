import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Constant/text_strings.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/empty_screen/empty_screen.dart';
import 'package:one_note/common/widget/layout/grid_layout.dart';
import 'package:one_note/common/widget/layout/list_layout.dart';
import 'package:one_note/core/locator/locator.dart';
import 'package:one_note/blocs/home_bloc/home_bloc.dart';

import '../../common/widget/appbar/appbar_action_buttons/action_button.dart';
import '../../common/widget/tile/vi_title.dart';
import '../../blocs/home_bloc/home_event.dart';
import '../../blocs/home_bloc/home_state.dart';
import '../../blocs/task_bloc/task_bloc.dart';
import '../../blocs/task_bloc/task_event.dart';
import '../../blocs/task_bloc/task_state.dart';
import 'widget/profile_Image_chip.dart';
import 'widget/progress_category_button.dart';
import '../../common/widget/tile/recend_task_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeBloc>()..add(LoadProgressStatuses()),
      child: Scaffold(
        appBar: _homeAppbar(),
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: ViSizes.defaultSpace) +
                  const EdgeInsets.only(top: ViSizes.defaultSpace),
          child: Column(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return ViGridLayout(
                    mainAxisExtent: 90,
                    itemCount: state.status.length,
                    itemBuilder: (context, index) {
                      return ViProgressCategoryButton(
                        status: state.status[index],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: ViSizes.spaceBtwSections / 2),
              const ViTitle(title: ViTexts.recendTask),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.categoryList.isEmpty) {
                    return const ViEmptyScreen();
                  }

                  return Expanded(
                    child: ViListLayout(
                      itemCount: state.categoryList.length,
                      itemBuilder: (context, index) {
                        var category = state.categoryList[index];

                        return RecendTaskButton(
                          title: category.title,
                          subTitle: category.subTitle,
                          checkList: category.checkList,
                          isComplatedValue: category.isCompletedValue,
                          category: category,
                          tagList: category.tagList,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
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
