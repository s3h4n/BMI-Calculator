import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'bmi_text_input.dart';

/// A custom date picker widget for BMI Calculator app.
class BMIDatePicker extends StatefulWidget {
  /// Creates a custom [BMIDatePicker].
  ///
  /// [label] is the label of this input field.
  /// [controller] is the controller to handle input field.
  /// [onChange] is the callback function to execute when user selects a date.
  const BMIDatePicker({
    Key? key,
    required this.label,
    required this.controller,
    this.onChange,
  }) : super(key: key);

  /// The input field label.
  final String label;

  /// The input field controller.
  final TextEditingController controller;

  /// The callback function to execute when the user selects a date.
  final Function(String value)? onChange;

  @override
  State<BMIDatePicker> createState() => _BMIDatePickerState();
}

class _BMIDatePickerState extends State<BMIDatePicker> {
  /// The color theme of the date picker.
  final _colorTheme = KColor.kPrimaryColor;

  /// The first date of the date picker.
  final _firstDate = 1920;

  /// The last date of the date picker.
  final _lastDate = DateTime.now();

  /// The initial date of the date picker.
  final _initialDate = DateTime.now();

  /// Opens a date picker dialog and sets the selected date in the input field.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime(_firstDate),
      lastDate: _lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: _colorTheme,
            colorScheme: ColorScheme.light(primary: _colorTheme),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        widget.controller.text = picked.toString().split(" ")[0];
      });

      if (widget.onChange != null) {
        widget.onChange!(widget.controller.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BMITextInput(
      label: widget.label,
      controller: widget.controller,
      type: TextInputType.datetime,
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }
}
