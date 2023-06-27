import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// A custom app bar widget for BMI Calculator app.
class BMIAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a custom [BMIAppBar].
  ///
  /// [title] is the optional title text to display in the app bar.
  const BMIAppBar({
    super.key,
    this.title = "",
  });

  /// The default title.
  final _titleText1 = "BMI ";
  final _titleText2 = "Calculator";

  /// The optional title text.
  final String title;

  /// The App Bar height.
  final _appbarHeight = 64.0;

  /// The background color.
  final _background = KColor.kBlack;

  /// The foreground color.
  final _foreground = KColor.kAccentColor;

  /// The title text style.
  final _titleStyle = const TextStyle(
    fontFamily: KFont.kPrimaryFamily,
    color: KColor.kBlack,
    fontSize: KFont.kPrimarySize + 6,
  );

  @override
  Size get preferredSize => Size.fromHeight(_appbarHeight);

  @override
  Widget build(BuildContext context) {
    final titleSection1 = TextSpan(
      text: _titleText1,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
    final titleSection2 = TextSpan(text: _titleText2);
    final titleSection3 = TextSpan(text: title);

    return AppBar(
      title: RichText(
        text: TextSpan(
          style: _titleStyle,
          children: title.trim().isEmpty
              ? <TextSpan>[titleSection1, titleSection2]
              : <TextSpan>[titleSection3],
        ),
      ),
      foregroundColor: _background,
      backgroundColor: _foreground,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
