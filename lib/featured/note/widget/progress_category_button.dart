import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/featured/note/bloc/home_bloc.dart';

import '../../../Util/Constant/enums.dart';

class ViProgressCategoryButton extends StatelessWidget {
  final ProgressStatus status;

  const ViProgressCategoryButton({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: getProgressColor(status),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ViSizes.md),
        child: Row(
          children: [
            Icon(
              getProgressIconData(status),
              size: ViSizes.iconLg,
              color: AppColors.ligth,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getProgressStatusText(status),
                  style: ViTextTheme.ligthTextTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "12 Tasks",
                  style: ViTextTheme.ligthTextTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Color getProgressColor(ProgressStatus status) {
  switch (status) {
    case ProgressStatus.completed:
      return AppColors.completed;
    case ProgressStatus.inProgress:
      return AppColors.inProgress;
    case ProgressStatus.ongoing:
      return AppColors.ongoing;
    case ProgressStatus.canceled:
      return AppColors.canceled;
    default:
      return Colors.grey; // Default color
  }
}

String getProgressStatusText(ProgressStatus status) {
  switch (status) {
    case ProgressStatus.completed:
      return "Completed";
    case ProgressStatus.inProgress:
      return "In Progress";
    case ProgressStatus.ongoing:
      return "Ongoing";
    case ProgressStatus.canceled:
      return "Canceled";
    default:
      return "";
  }
}

IconData getProgressIconData(ProgressStatus status) {
  switch (status) {
    case ProgressStatus.completed:
      return Iconsax.tick_circle;
    case ProgressStatus.inProgress:
      return Iconsax.timer;
    case ProgressStatus.ongoing:
      return Iconsax.clipboard_tick;
    case ProgressStatus.canceled:
      return Iconsax.clipboard_close;
    default:
      return Icons.clear_outlined;
  }
}
