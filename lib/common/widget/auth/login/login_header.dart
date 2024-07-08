import 'package:flutter/material.dart';
import 'package:one_note/Util/Device/device_utility.dart';

class ViLoginHeader extends StatelessWidget {
  const ViLoginHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ViDeviceUtils.getAppBarHeigth() * 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineLarge),
          Text(subtitle, style: Theme.of(context).textTheme.headlineSmall),
        ],
      ),
    );
  }
}
