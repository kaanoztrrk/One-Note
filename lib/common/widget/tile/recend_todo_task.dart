import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';

import '../../style/container_style.dart';

class RecendToDoTaskButton extends StatefulWidget {
  final String text;
  final bool? isCheck;
  final bool initialChecked;
  final double? size;
  final Color? bgColor;
  final Function(bool?)? onChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onDone;
  final bool? disableCheckBox;
  final bool? doneActionButton;

  const RecendToDoTaskButton({
    super.key,
    required this.text,
    this.size = 30,
    this.initialChecked = false,
    this.bgColor,
    this.isCheck,
    this.onChanged,
    this.onDelete,
    this.onEdit,
    this.onDone,
    this.disableCheckBox = false,
    this.doneActionButton = false,
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

  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.text),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          if (widget.doneActionButton == true)
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
        heigth: calculateHeight(widget.text),
        bgColor:
            _isChecked ? AppColors.softGrey : widget.bgColor ?? AppColors.white,
        margin: const EdgeInsets.only(top: ViSizes.md),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (widget.disableCheckBox != true) ...[
              Checkbox(
                value: widget.isCheck,
                onChanged: (isChecked) {
                  widget.onChanged?.call(isChecked);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                activeColor: AppColors.info,
                checkColor: AppColors.white,
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Text(
                    widget.text,
                    style: ViTextTheme.ligthTextTheme.titleLarge?.copyWith(
                      fontSize: constraints.maxWidth * 0.05,
                      color: AppColors.textSecondary,
                      decoration: _isChecked
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
      ),
    );
  }
}
