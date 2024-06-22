import 'package:flutter/material.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

class ViTitle extends StatelessWidget {
  const ViTitle(
      {super.key,
      required this.title,
      this.showAll,
      this.onTap,
      this.bigFont = false});

  final String title;
  final bool? showAll;
  final Function()? onTap;
  final bool? bigFont;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: bigFont == true
              ? ViTextTheme.ligthTextTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.w500)
              : ViTextTheme.ligthTextTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w500),
        ),
        Spacer(),
        showAll == true
            ? GestureDetector(
                onTap: onTap,
                child: Text(
                  "See All",
                  style: ViTextTheme.ligthTextTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
              )
            : Text(""),
      ],
    );
  }
}
