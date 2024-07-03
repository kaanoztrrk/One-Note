// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:one_note/Util/Device/device_utility.dart';
import 'package:one_note/common/widget/tile/vi_title.dart';

import '../../../../../Util/Constant/colors.dart';

class ViSelectedColor extends StatefulWidget {
  final Function(Color) onColorSelected;

  const ViSelectedColor({super.key, required this.onColorSelected});

  @override
  _ViSelectedColorState createState() => _ViSelectedColorState();
}

class _ViSelectedColorState extends State<ViSelectedColor> {
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ViDeviceUtils.getScreenWidth(context),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ViTitle(title: "Selected Color"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _colorBox(AppColors.accent),
              _colorBox(AppColors.green),
              _colorBox(AppColors.blue),
              _colorBox(AppColors.coral),
              _colorBox(AppColors.purple),
            ],
          ),
        ],
      ),
    );
  }

  Widget _colorBox(Color color) {
    bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
        widget.onColorSelected(color);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
        ),
      ),
    );
  }
}
