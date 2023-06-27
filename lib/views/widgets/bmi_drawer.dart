import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A custom drawer widget for BMI Calculator app.
class BMIDrawer extends StatelessWidget {
  /// Creates a custom [BMIDrawer].
  BMIDrawer({super.key});

  /// The name of the author.
  final _authorName = "Built by ${KApp.kAuthor}";

  /// The name of the application.
  final _appName = TextSpan(
    children: [
      TextSpan(
        text: "BMI ",
        style: KFont.kMediumBold.copyWith(color: KColor.kBlack),
      ),
      TextSpan(
        text: "Calculator",
        style: KFont.kMedium.copyWith(color: KColor.kBlack),
      )
    ],
  );

  /// The icon of the app.
  final _appIcon = KApp.kIcon;

  /// The height of the icon.
  final _appIconHeight = 100.0;

  /// The footer/bottom text.
  final _footerText = KApp.kFooter;

  /// The background color of the drawer.
  final _background = KColor.kAccentColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: KLayout.kLargePaddingAll,
          color: _background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  KLayout.kAddYGap,
                  Image.asset(_appIcon, height: _appIconHeight),
                  KLayout.kAdd2YGap,
                  RichText(text: _appName),
                  KLayout.kAddHalfYGap,
                  Text(
                    _authorName,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              Text(_footerText, style: KFont.kBody)
            ],
          ),
        ),
      ),
    );
  }
}
