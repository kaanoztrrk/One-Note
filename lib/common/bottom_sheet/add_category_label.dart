import 'package:flutter/material.dart';

import 'package:one_note/Util/Constant/sizes.dart';

import '../../Util/Constant/colors.dart';
import '../../Util/Device/device_utility.dart';
import '../../Util/Theme/Custom_Themes.dart/text_theme.dart';
import '../style/container_style.dart';
import '../widget/button/classic_button.dart';

class AddCategoryLabelBottomSheet {
  static void showAddTagBottomSheet({
    required BuildContext context,
    required List<String> tags,
    required Function(List<String>) onTagsUpdated,
  }) {
    final TextEditingController tagController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ViContainer(
                  heigth: 60,
                  padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
                  child: TextField(
                    controller: tagController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Add Categories",
                      hintStyle: ViTextTheme.ligthTextTheme.titleMedium
                          ?.copyWith(color: AppColors.darkerGrey),
                    ),
                  ),
                ),
                const SizedBox(height: ViSizes.sm),
                ViClassicButton(
                  title: "Add Categories",
                  heigth: ViDeviceUtils.getScreenHeigth(context) * 0.08,
                  onTap: () {
                    if (tagController.text.isNotEmpty) {
                      tags.add(tagController.text);
                      onTagsUpdated(tags);
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: ViSizes.sm),
              ],
            ),
          ),
        );
      },
    );
  }
}
