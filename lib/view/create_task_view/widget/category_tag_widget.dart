import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/bottom_sheet/add_category_label.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    super.key,
    this.categoryName,
    required this.tags,
    this.extraWidget = false,
    required this.onTagsUpdated,
  });

  final String? categoryName;
  final bool? extraWidget;
  final List<String> tags;
  final Function(List<String>) onTagsUpdated;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = List.from(widget.tags);
  }

  void _updateTags(List<String> updatedTags) {
    setState(() {
      _tags = updatedTags;
    });
    widget.onTagsUpdated(updatedTags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViTitle(
          title: widget.categoryName ?? "",
          widget: widget.extraWidget,
          buttonText: "Add",
          onTap: () => AddCategoryLabelBottomSheet.showAddTagBottomSheet(
            context: context,
            tags: _tags,
            onTagsUpdated: _updateTags,
          ),
        ),
        const SizedBox(height: ViSizes.spaceBtwItems),
        if (_tags.isEmpty)
          Center(
            child: Text(
              "No Tag...",
              style: ViTextTheme.ligthTextTheme.bodyLarge
                  ?.apply(color: AppColors.grey),
            ),
          )
        else
          Wrap(
            spacing: ViSizes.spaceBtwItems,
            runSpacing: ViSizes.spaceBtwItems / 2,
            children: _tags.map((tag) {
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
