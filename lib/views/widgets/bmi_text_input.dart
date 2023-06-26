import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class BMITextInput extends StatelessWidget {
  const BMITextInput({
    Key? key,
    required this.label,
    required this.controller,
    required this.type,
    this.max = 32,
    this.readOnly = false,
    this.onEditingComplete,
    this.onTap,
    this.onChange,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final TextInputType type;
  final int max;
  final bool readOnly;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: KFont.kBody),
        KLayout.kAddHalfYGap,
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r"^[A-Za-z\s]+$")),
          ],
          controller: controller,
          style: KFont.kBodyBold,
          decoration: KTheme.kInputBorder,
          cursorColor: KColor.kBlack,
          cursorWidth: 1.0,
          keyboardType: type,
          maxLength: max,
          readOnly: readOnly,
          onEditingComplete: onEditingComplete,
          onChanged: onChange,
          onTap: onTap,
        ),
      ],
    );
  }
}
