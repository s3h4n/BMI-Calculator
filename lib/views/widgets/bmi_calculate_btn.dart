import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A custom button widget for BMI Calculator app.
class BMICalculateButton extends StatelessWidget {
  /// Creates a custom [BMICalculateButton].
  ///
  /// [onClick] is the callback function to execute when the button is clicked.
  BMICalculateButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  /// The button action.
  final Function onClick;

  /// The button height.
  final _buttonHeight = KLayout.kPrimaryHeight;

  /// The button text.
  final _buttonText = "Calculate BMI";

  /// The button text style.
  final _buttonTextStyle = KFont.kBodyBoldDark;

  /// The button background.
  final _background = KColor.kPrimaryColor;

  /// The button text style.
  final _radius = KLayout.kRadiusAll;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _background,
      borderRadius: _radius,
      child: InkWell(
        onTap: onClick as void Function()?,
        child: Container(
          height: _buttonHeight,
          alignment: Alignment.center,
          child: Text(_buttonText, style: _buttonTextStyle),
        ),
      ),
    );
  }
}
