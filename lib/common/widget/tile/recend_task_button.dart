// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container_style.dart';
import 'package:one_note/common/widget/progress_indicator/progress_indicator.dart';

import '../../../data/src/model/category_model/category_model.dart';
import '../../../data/src/model/task_model/task_model.dart';

class RecendTaskButton extends StatefulWidget {
  const RecendTaskButton({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isCompletedValue,
    required this.checkList,
    required this.category,
    required this.tagList,
    this.onDelete,
    this.onEdit,
    this.onDone,
    this.onTap,
  });

  final String title;
  final String subTitle;
  final double isCompletedValue;
  final List<Task> checkList;
  final List<String> tagList;
  final CategoryModel category;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onDone;
  final Function()? onTap;

  @override
  _RecendTaskButtonState createState() => _RecendTaskButtonState();
}

class _RecendTaskButtonState extends State<RecendTaskButton> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.title),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          if (_isChecked)
            SlidableAction(
              onPressed: (context) {
                widget.onDone?.call();
                setState(() {
                  _isChecked = true;
                });
              },
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.success,
              icon: Icons.check,
            ),
          SlidableAction(
            onPressed: (context) => widget.onEdit?.call(),
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.warning,
            icon: Icons.edit,
          ),
          SlidableAction(
            onPressed: (context) => widget.onDelete?.call(),
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.error,
            icon: Icons.delete,
          ),
        ],
      ),
      child: ViContainer(
        onTap: widget.onTap,
        margin: const EdgeInsets.only(top: ViSizes.md),
        padding: const EdgeInsets.all(ViSizes.md),
        heigth: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.title.length > 20
                      ? '${widget.title.substring(0, 20)}...'
                      : widget.title,
                  style: ViTextTheme.ligthTextTheme.headlineSmall,
                ),
                Text(
                  widget.subTitle.length > 20
                      ? '${widget.subTitle.substring(0, 20)}...'
                      : widget.subTitle,
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
                      "${widget.checkList.length} tasks",
                      style: ViTextTheme.ligthTextTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            ViCircularProgressIndicator(
              value: widget.isCompletedValue,
              size: 80,
            )
          ],
        ),
      ),
    );
  }
}
