import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'bmi_text_input.dart';

class BMIDateTimePicker extends StatefulWidget {
  const BMIDateTimePicker({
    Key? key,
    required this.label,
    required this.controller,
    this.onChange,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final Function(String value)? onChange;

  @override
  State<BMIDateTimePicker> createState() => _BMIDateTimePickerState();
}

class _BMIDateTimePickerState extends State<BMIDateTimePicker> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: KColor.kPrimaryColor,
            colorScheme: const ColorScheme.light(primary: KColor.kPrimaryColor),
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
      onTap: () {
        _selectDate(context);
      },
    );
  }
}
