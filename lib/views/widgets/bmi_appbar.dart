import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class BMIAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BMIAppBar({super.key, this.title = ""});

  final _titleText1 = "BMI ";
  final _titleText2 = "Calculator";
  final String title;
  final _titleStyle = const TextStyle(
    fontFamily: KFont.kPrimaryFamily,
    color: KColor.kBlack,
    fontSize: KFont.kPrimarySize + 6,
  );

  @override
  Size get preferredSize => const Size.fromHeight(64);

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
      foregroundColor: KColor.kBlack,
      backgroundColor: KColor.kAccentColor,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }
}
