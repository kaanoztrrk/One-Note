import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Constant/sizes.dart';

class ViContainer extends StatelessWidget {
  const ViContainer({
    super.key,
    this.child,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.heigth = 100.0,
    this.onTap,
    this.bgColor,
  });

  final Widget? child;
  final double? heigth;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigth,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.textWhite,
          borderRadius: BorderRadius.circular(
            ViSizes.borderRadiusLg,
          ),
          border: Border.all(width: 2),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              color: AppColors.black,
            )
          ],
        ),
        child: child != null
            ? IntrinsicHeight(
                child: child,
              )
            : null,
      ),
    );
  }
}
