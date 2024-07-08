import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Constant/text_strings.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/blocs/auth_blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:one_note/common/widget/appbar/appbar.dart';
import 'package:one_note/common/widget/empty_screen/empty_screen.dart';
import 'package:one_note/common/widget/layout/grid_layout.dart';
import 'package:one_note/common/widget/layout/list_layout.dart';
import 'package:one_note/core/locator/locator.dart';
import 'package:one_note/blocs/home_bloc/home_bloc.dart';
import 'package:one_note/core/routes/routes.dart';
import '../../blocs/auth_blocs/sign_in_bloc/sign_in_event.dart';
import '../../blocs/auth_blocs/sign_in_bloc/sign_in_state.dart';
import 'widget/profile_Image_chip.dart';

import '../../Util/Constant/image_strings.dart';
import '../../common/widget/appbar/appbar_action_buttons/action_button.dart';
import '../../common/widget/tile/vi_title.dart';
import '../../blocs/home_bloc/home_event.dart';
import '../../blocs/home_bloc/home_state.dart';
import 'widget/progress_category_button.dart';
import '../../common/widget/tile/recend_task_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>.value(
            value: getIt<HomeBloc>()..add(LoadProgressStatuses())),
        BlocProvider<SignInBloc>.value(value: getIt<SignInBloc>()),
      ],
      child: Scaffold(
        appBar: ViAppBar(
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
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                return AppBarActionButton(
                  icon: Iconsax.category,
                  onTap: () {
                    context.read<SignInBloc>().add(const SignOutRequired());
                  },
                );
              },
            ),
          ],
        ),
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
                    return ViEmptyScreen(
                      showRotateArrow: true,
                      image: ViImages().emtyScreen,
                      title: "To-Do List Empty",
                      subtitle: "You Can add a task from the button below",
                    );
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
                          category: category,
                          tagList: category.tagList,
                          isCompletedValue: 0.0,
                          onTap: () {
                            context.push(Routes.task_detail, extra: category);
                          },
                          onEdit: () {
                            context.push(Routes.task_detail, extra: category);
                          },
                          onDelete: () {
                            BlocProvider.of<HomeBloc>(context)
                                .add(DeleteCategoryEvent(category: category));
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
