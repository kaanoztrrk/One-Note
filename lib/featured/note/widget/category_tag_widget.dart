import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final List<String> tags;

  const CategoryWidget({
    Key? key,
    required this.categoryName,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ViTitle(title: "Category"),
          const SizedBox(height: ViSizes.spaceBtwItems),
          if (tags.isEmpty)
            const Center(
              child: Text(
                "No Tag",
                style: TextStyle(color: AppColors.grey),
              ),
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
      ),
    );
  }
}
