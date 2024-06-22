import 'package:flutter/material.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

class ViTitle extends StatelessWidget {
  const ViTitle({super.key, required this.title, this.showAll, this.onTap});

  final String title;
  final bool? showAll;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: ViTextTheme.ligthTextTheme.headlineSmall
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
