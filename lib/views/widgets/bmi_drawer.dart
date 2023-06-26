import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class BMIDrawer extends StatelessWidget {
  const BMIDrawer({
    super.key,
  });

  final _authorName = "Built by S3H4N";
  final _appName = KApp.kName;
  final _appIcon = "assets/images/icon.png";
  final _footerText = "Made with Flutter 💙";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: KLayout.kLargePaddingAll,
        color: KColor.kAccentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(_appIcon, height: 100),
                KLayout.kAddYGap,
                Text(
                  _appName,
                  style: KFont.kMediumBold.copyWith(color: KColor.kBlack),
                ),
                Text(_authorName),
              ],
            ),
            Text(_footerText, style: KFont.kBody)
          ],
        ),
      ),
    );
  }
}
