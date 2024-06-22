import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Util/Constant/colors.dart';
import '../../../Util/Constant/sizes.dart';

class ViContainer extends StatelessWidget {
  const ViContainer({
    super.key,
    this.child,
    this.height = 100,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            ViSizes.borderRadiusLg,
          ),
          border: Border.all(width: 2),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              color: AppColors.black,
            )
          ]),
      child: child,
    );
  }
}
