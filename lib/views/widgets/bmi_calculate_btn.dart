import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class BMICalculateButton extends StatelessWidget {
  BMICalculateButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final Function onClick;
  final double _buttonHeight = KLayout.kPrimaryHeight;
  final String _buttonText = "Calculate BMI";
  final TextStyle _buttonTextStyle =
      KFont.kBodyBold.copyWith(color: KColor.kWhite);
  final BoxDecoration _buttonDecoration = KTheme.kButtonStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick as void Function()?,
      child: Container(
        height: _buttonHeight,
        alignment: Alignment.center,
        decoration: _buttonDecoration,
        child: Text(_buttonText, style: _buttonTextStyle),
      ),
    );
  }
}
