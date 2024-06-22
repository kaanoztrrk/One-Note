import 'package:flutter/material.dart';

import '../../../Util/Constant/sizes.dart';

class ViListLayout extends StatelessWidget {
  const ViListLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 100,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: itemBuilder,
    );
  }
}
