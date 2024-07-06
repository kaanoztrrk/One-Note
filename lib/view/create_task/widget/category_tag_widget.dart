import 'package:flutter/material.dart';
import 'package:one_note/Util/Constant/colors.dart';
import 'package:one_note/Util/Constant/sizes.dart';
import 'package:one_note/Util/Theme/Custom_Themes.dart/text_theme.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';

import '../../../Util/Device/device_utility.dart';
import '../../../common/widget/button/classic_button.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({
    Key? key,
    this.categoryName,
    required this.tags,
    this.extraWidget = false,
    required this.onTagsUpdated,
  }) : super(key: key);

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

  void _showAddTagBottomSheet(BuildContext context) {
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
                      setState(() {
                        _tags.add(tagController.text);
                        widget.onTagsUpdated(_tags);
                      });
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViTitle(
          title: widget.categoryName ?? "",
          widget: widget.extraWidget,
          buttonText: "Add",
          onTap: () => _showAddTagBottomSheet(context),
        ),
        const SizedBox(height: ViSizes.spaceBtwItems),
        if (_tags.isEmpty)
          Center(
            child: Text("No Tag...",
                style: ViTextTheme.ligthTextTheme.bodyLarge
                    ?.apply(color: AppColors.grey)),
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
