import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/image_strings.dart';
import 'package:one_note/Util/Device/device_utility.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

class ViEmptyScreen extends StatelessWidget {
  const ViEmptyScreen({
    super.key,
    this.spacer = false,
    required this.image,
    required this.title,
    required this.subtitle,
    this.showRotateArrow = false, // Yeni parametre eklendi
  });

  final bool? spacer;
  final String image;
  final String title;
  final String subtitle;
  final bool showRotateArrow; // Yeni parametre

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Image(
            height: ViDeviceUtils.getScreenHeigth(context) * 0.25,
            image: AssetImage(image),
          ),
        ),
        Text(
          title,
          style: ViTextTheme.ligthTextTheme.titleLarge,
        ),
        Text(
          subtitle,
          style: ViTextTheme.ligthTextTheme.bodyLarge!
              .apply(color: AppColors.textSecondary),
        ),
        SizedBox(
          height: spacer == true
              ? ViDeviceUtils.getScreenHeigth(context) * 0.15
              : ViDeviceUtils.getScreenHeigth(context) * 0.05,
        ),
        if (showRotateArrow)
          Transform.rotate(
            angle: 50 * (3.1415927 / 180),
            child: Image(
              width: 100,
              height: 100,
              image: AssetImage(ViImages().add_task_arrow),
            ),
          ),
      ],
    );
  }
}
