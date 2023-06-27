import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A selectable option widget for BMI selection in the BMI Calculator app.
class BMISelectOption extends StatelessWidget {
  /// Creates a custom [BMISelectOption].
  BMISelectOption({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  /// The image path for the option.
  final String imagePath;

  /// The text label for the option.
  final String text;

  /// Whether the option is currently selected.
  final bool isSelected;

  /// The callback function when the option is tapped.
  final void Function() onTap;

  /// The background color when the option is selected.
  final _selectedBackground = KColor.kPrimaryColor.withAlpha(30);

  /// The background color when the option is not selected.
  final _defaultBackground = KColor.kWhite;

  /// The border color when the option is selected.
  final _selectedBorder = KColor.kPrimaryColor;

  /// The border color when the option is not selected.
  final _defaultBorder = Colors.transparent;

  /// The border radius of the option.
  final _radius = KLayout.kRadiusAll;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: MediaQuery.of(context).size.width / 2 - 72,
          decoration: BoxDecoration(
            color: isSelected ? _selectedBackground : _defaultBackground,
            border: Border.all(
              color: isSelected ? _selectedBorder : _defaultBorder,
            ),
            borderRadius: _radius,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: KLayout.kRadiusAll,
          ),
        ),
        KLayout.kAddHalfYGap,
        Text(text, style: isSelected ? KFont.kBodyBold : KFont.kBody),
        KLayout.kAddHalfYGap,
      ],
    );
  }
}
