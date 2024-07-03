// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:one_note/common/style/container/container_style.dart';
import 'package:intl/intl.dart'; // intl paketini import edin

import '../../../../../Util/Constant/colors.dart';
import '../../../../../Util/Constant/sizes.dart';
import '../../../../../Util/Theme/Custom_Themes.dart/text_theme.dart';

class DateSelectedButton extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  const DateSelectedButton({super.key, required this.onDateSelected});

  @override
  _DateSelectedButtonState createState() => _DateSelectedButtonState();
}

class _DateSelectedButtonState extends State<DateSelectedButton> {
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy'); // Tarih formatlayıcı

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: ViContainer(
        heigth: 60,
        padding: const EdgeInsets.only(top: 5, left: ViSizes.sm),
        child: Row(
          children: [
            Text(
              _selectedDate != null
                  ? _dateFormat.format(_selectedDate!)
                  : "Select a Date",
              style: ViTextTheme.ligthTextTheme.titleMedium
                  ?.copyWith(color: AppColors.darkerGrey),
            ),
          ],
        ),
      ),
    );
  }
}
