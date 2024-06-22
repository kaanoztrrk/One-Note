import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_note/Util/Constant/colors.dart';

class ProfileImageChip extends StatelessWidget {
  const ProfileImageChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
