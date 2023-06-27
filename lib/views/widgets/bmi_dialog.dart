import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A custom dialog widget for BMI Calculator app.
class BMIDialog extends StatelessWidget {
  /// Creates a custom [BMIDialog].
  const BMIDialog({super.key});

  /// The height of the dialog box.
  final _dialogHeight = 164.0;

  /// The icon of the dialog box.
  final _dialogIcon = Icons.error;

  /// The color of the icon.
  final _dialogIconColor = KColor.kPrimaryColor;

  /// The background color of the dialog box.
  final _dialogBackground = KColor.kWhite;

  /// The height of the icon.
  final _dialogIconHeight = 64.0;

  /// The content of the dialog box.
  final _dialogMessage = "Please fill out all the details.";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: _dialogBackground,
      child: Container(
        padding: KLayout.kLargePaddingAll,
        alignment: Alignment.center,
        height: _dialogHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              _dialogIcon,
              color: _dialogIconColor,
              size: _dialogIconHeight,
            ),
            KLayout.kAddYGap,
            Text(
              _dialogMessage,
              style: KFont.kBody,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
