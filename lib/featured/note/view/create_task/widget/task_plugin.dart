import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ViTaskPluginWidget extends StatelessWidget {
  const ViTaskPluginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.element_equal)),
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.text)),
        IconButton(onPressed: () {}, icon: const Icon(Iconsax.paperclip))
      ],
    );
  }
}
