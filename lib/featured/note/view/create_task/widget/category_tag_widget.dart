import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    this.categoryName,
    required this.tags,
    this.extraWidget = false,
    this.onTap,
  });

  final String? categoryName;
  final bool? extraWidget;
  final List<String> tags;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViTitle(
          title: categoryName ?? "",
          widget: extraWidget,
          buttonText: "Add",
          onTap: onTap,
        ),
        const SizedBox(height: ViSizes.spaceBtwItems),
        if (tags.isEmpty)
          Center(
            child: Text("No Tag...",
                style: ViTextTheme.ligthTextTheme.bodyLarge
                    ?.apply(color: AppColors.grey)),
          )
        else
          Wrap(
            spacing: ViSizes.spaceBtwItems,
            runSpacing: ViSizes.spaceBtwItems / 2,
            children: tags.map((tag) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(ViSizes.borderRadiusSm),
                ),
                child: Text(tag),
              );
            }).toList(),
          ),
      ],
    );
  }
}
