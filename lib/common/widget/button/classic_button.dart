import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

class ViClassicButton extends StatelessWidget {
  const ViClassicButton(
      {super.key,
      this.heigth = 100,
      required this.title,
      this.onTap,
      this.bgColor});

  final double? heigth;
  final String title;
  final Function()? onTap;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: heigth,
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.primary,
            borderRadius: BorderRadius.circular(ViSizes.borderRadiusMd)),
        child: Text(
          title,
          style: ViTextTheme.ligthTextTheme.titleLarge
              ?.apply(color: AppColors.ligth),
        ),
      ),
    );
  }
}
