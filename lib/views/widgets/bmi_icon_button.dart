import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A custom icon button for BMI Calculator app.
class BMIIconButton extends StatelessWidget {
  /// Creates a custom [BMIIconButton].
  ///
  /// [icon] is the icon to be displayed on the button.
  /// [action] is the callback function to execute when the button is pressed.
  BMIIconButton({
    Key? key,
    required this.icon,
    required this.action,
  }) : super(key: key);

  /// Icon to be displayed on the button.
  final IconData icon;

  /// The callback function to execute when the button is pressed.
  final void Function()? action;

  /// The button height.
  final _buttonHeight = MaterialStateProperty.all(const Size.fromHeight(64));

  /// The button foreground color.
  final _foreground = MaterialStateProperty.all(KColor.kPrimaryColor);

  /// The button background color.
  final _background = MaterialStateProperty.all(KColor.kWhite);

  /// The button shape.
  final _shape = MaterialStateProperty.all(
    const RoundedRectangleBorder(borderRadius: KLayout.kRadiusAll),
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      style: ButtonStyle(
        fixedSize: _buttonHeight,
        foregroundColor: _foreground,
        backgroundColor: _background,
        shape: _shape,
      ),
      child: Icon(icon),
    );
  }
}
