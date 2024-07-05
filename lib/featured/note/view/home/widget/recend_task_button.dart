import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:one_note/common/widget/progress_indicator/progress_indicator.dart';
import 'package:one_note/core/routes/routes.dart';
import 'package:one_note/featured/note/view/task_detail/task_detail_view.dart';

import '../../../model/category_model/category_model.dart';
import '../../../model/task_model/task_model.dart';

class RecendTaskButton extends StatelessWidget {
  const RecendTaskButton({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.isComplatedValue,
    required this.checkList,
    required this.category,
    required this.tagList,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final double isComplatedValue;
  final List<Task> checkList;
  final List<String> tagList;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ViContainer(
      onTap: () => context.push(Routes.task_detail, extra: category),
      margin: const EdgeInsets.only(top: ViSizes.md),
      padding: const EdgeInsets.all(ViSizes.md),
      heigth: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title.length > 20 ? '${title.substring(0, 20)}...' : title,
                style: ViTextTheme.ligthTextTheme.headlineSmall,
              ),
              Text(
                subTitle.length > 20
                    ? '${subTitle.substring(0, 20)}...'
                    : subTitle,
                style: ViTextTheme.ligthTextTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.done_sharp,
                    color: AppColors.black,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${checkList.length} tasks",
                    style: ViTextTheme.ligthTextTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          ViCircularProgressIndicator(
            value: isComplatedValue,
            size: 80,
          )
        ],
      ),
    );
  }
}
