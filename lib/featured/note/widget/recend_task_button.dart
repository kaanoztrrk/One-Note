import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:one_note/common/widget/progress_indicator/progress_indicator.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RecendTaskButton extends StatelessWidget {
  const RecendTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ViContainer(
      height: 120,
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
                "Web site For Theviacoder",
                style: ViTextTheme.ligthTextTheme.headlineSmall,
              ),
              Text(
                "Digital Product Design",
                style: ViTextTheme.ligthTextTheme.bodyLarge,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.expand_circle_down_rounded),
                  const SizedBox(width: 5),
                  Text(
                    "12 Tasks",
                    style: ViTextTheme.ligthTextTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          ViCircularProgressIndicator(
            value: 0.1,
            size: 80,
          )
        ],
      ),
    );
  }
}
