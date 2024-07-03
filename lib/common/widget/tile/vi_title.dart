import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

class ViTitle extends StatelessWidget {
  const ViTitle(
      {super.key,
      required this.title,
      this.widget,
      this.onTap,
      this.isBigFont = false,
      this.style,
      this.buttonText});

  final String title;
  final bool? widget;
  final Function()? onTap;
  final bool? isBigFont;
  final TextStyle? style;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: style ??
              (isBigFont == true
                  ? ViTextTheme.ligthTextTheme.headlineLarge
                      ?.copyWith(fontWeight: FontWeight.w500)
                  : ViTextTheme.ligthTextTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w500)),
        ),
        const Spacer(),
        widget == true
            ? GestureDetector(
                onTap: onTap,
                child: Text(
                  buttonText ?? "",
                  style: ViTextTheme.ligthTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.primary),
                ),
              )
            : const Text(""),
      ],
    );
  }
}
