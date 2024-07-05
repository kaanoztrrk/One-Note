// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

import '../../../../../common/style/container/container_style.dart';

class RecendToDoTaskButton extends StatefulWidget {
  final String text;

  final bool? isCheck;
  final bool initialChecked;
  final double? size;
  final Color? bgColor;
  final Function(bool?)? onChanged;

  const RecendToDoTaskButton({
    super.key,
    required this.text,
    this.size = 30,
    this.initialChecked = false,
    this.bgColor,
    this.isCheck,
    this.onChanged,
  });

  @override
  State<RecendToDoTaskButton> createState() => _RecendToDoTaskButtonState();
}

class _RecendToDoTaskButtonState extends State<RecendToDoTaskButton> {
  double calculateHeight(String text) {
    double baseHeight = 80;
    double textLengthFactor = text.length * 0.3;
    return baseHeight + textLengthFactor;
  }

  @override
  Widget build(BuildContext context) {
    return ViContainer(
      heigth: calculateHeight(widget.text),
      bgColor: widget.bgColor ?? AppColors.white,
      margin: const EdgeInsets.only(top: ViSizes.md),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          /*
          Checkbox(
            value: widget.isCheck,
            onChanged: widget.onChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            activeColor: AppColors.info,
            checkColor: AppColors.white,
          ),
        */
          const SizedBox(width: 10),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Text(
                  widget.text,
                  style: ViTextTheme.ligthTextTheme.titleLarge?.copyWith(
                    fontSize: constraints.maxWidth * 0.05,
                    color: AppColors.textSecondary,
                    decoration: widget.isCheck == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                );
              },
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.more),
          ),
        ],
      ),
    );
  }
}
