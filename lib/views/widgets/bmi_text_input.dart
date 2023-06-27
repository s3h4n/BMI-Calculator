import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A custom text input widget for BMI Calculator app.
class BMITextInput extends StatelessWidget {
  /// Creates a custom [BMITextInput].
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

  /// The label of the text input.
  final String label;

  /// The controller to handle the text input.
  final TextEditingController controller;

  /// The type of the keyboard input.
  final TextInputType type;

  /// The maximum length of the input text.
  final int max;

  /// Whether the input is read-only.
  final bool readOnly;

  /// The callback function when editing is completed.
  final VoidCallback? onEditingComplete;

  /// The callback function when the input is tapped.
  final VoidCallback? onTap;

  /// The callback function when the input value is changed.
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: KFont.kBody),
        KLayout.kAddHalfYGap,
        TextField(
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
