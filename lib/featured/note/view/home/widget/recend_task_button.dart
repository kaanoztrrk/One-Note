import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:one_note/common/widget/progress_indicator/progress_indicator.dart';
import 'package:one_note/core/routes/routes.dart';

class RecendTaskButton extends StatelessWidget {
  const RecendTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViContainer(
      onTap: () => context.push(Routes.task_detail),
      heigth: 120,
      margin: const EdgeInsets.only(top: ViSizes.md),
      padding: const EdgeInsets.all(ViSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "title",
                style: ViTextTheme.ligthTextTheme.headlineSmall,
              ),
              Text(
                "subTitle",
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
                    "tasks",
                    style: ViTextTheme.ligthTextTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          const ViCircularProgressIndicator(
            value: 0.0,
            size: 80,
          )
        ],
      ),
    );
  }
}
