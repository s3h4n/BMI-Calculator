import 'package:flutter/material.dart';

class KApp {
  static const kName = "BMI Calculator";
  static const kAuthor = "S3H4N";
  static const kIcon = "assets/images/icon.png";
  static const kFooter = "Made with Flutter.";
}

class KColor {
  static const kPrimaryColor = Color(0XFF4C4ADE);
  static const kPrimaryColorShade = Color(0XFF7251b5);
  static const kSecondaryColor = Color(0XFFF1E300);
  static const kAccentColor = Color(0XFFECF3FA);
  static const kWhite = Color(0XFFFFFFFF);
  static const kBlack = Color(0XFF001524);
  static const kBlackShade = Color(0XFF1C2541);
  static const kPrimaryGradient = LinearGradient(
    colors: [
      KColor.kPrimaryColor,
      KColor.kPrimaryColorShade,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );
  static const kBlackGradient = LinearGradient(
    colors: [
      KColor.kBlack,
      KColor.kBlackShade,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );
}

class KLayout {
  static const kPrimarySpace = 16.0;
  static const kLargeSpace = 30.0;
  static const kPrimaryRadius = 12.5;
  static const kLargeRadius = 30.0;
  static const kPrimaryHeight = 64.0;
  static const kRadiusAll = BorderRadius.all(Radius.circular(kPrimaryRadius));
  static const kLargeRadiusAll = BorderRadius.all(Radius.circular(30));
  static const kPaddingAll = EdgeInsets.all(kPrimarySpace);
  static const kLargePaddingAll = EdgeInsets.all(kLargeSpace);
  static const kMarginAll = EdgeInsets.all(kPrimarySpace);
  static const kLargeMarginAll = EdgeInsets.all(kLargeSpace);
  static const kAddHalfYGap = SizedBox(height: KLayout.kPrimarySpace / 2);
  static const kAddHalfXGap = SizedBox(width: KLayout.kPrimarySpace / 2);
  static const kAddYGap = SizedBox(height: KLayout.kPrimarySpace);
  static const kAddXGap = SizedBox(width: KLayout.kPrimarySpace);
  static const kAdd2YGap = SizedBox(height: KLayout.kPrimarySpace * 2);
  static const kAdd2XGap = SizedBox(width: KLayout.kPrimarySpace * 2);
  static const kAddYDivider = VerticalDivider(
    width: 0,
    thickness: 1.5,
    indent: 10,
    color: KColor.kAccentColor,
  );
}

class KTheme {
  static const kInputBorderStyle = OutlineInputBorder(
    borderRadius: KLayout.kRadiusAll,
    borderSide: BorderSide(color: KColor.kWhite),
  );

  static const kInputBorderSelectedStyle = OutlineInputBorder(
    borderRadius: KLayout.kRadiusAll,
    borderSide: BorderSide(color: KColor.kPrimaryColor),
  );

  static const kInputBorder = InputDecoration(
    fillColor: KColor.kWhite,
    filled: true,
    border: kInputBorderStyle,
    focusedBorder: kInputBorderSelectedStyle,
    enabledBorder: kInputBorderStyle,
    counterStyle: TextStyle(height: double.minPositive),
    counterText: "",
  );
}

class KFont {
  static const kPrimaryFamily = "Anek Latin";
  static const kPrimarySize = 16.0;
  static const kMediumSize = 24.0;
  static const kLargeSize = 48.0;

  // Body
  static const kBody = TextStyle(
    fontFamily: kPrimaryFamily,
    fontSize: kPrimarySize,
    color: KColor.kBlack,
  );
  static const kBodyDark = TextStyle(
    fontFamily: kPrimaryFamily,
    fontSize: kPrimarySize,
    color: KColor.kWhite,
  );
  static TextStyle kBodyBold = kBody.copyWith(fontWeight: FontWeight.bold);
  static TextStyle kBodyBoldDark =
      kBodyDark.copyWith(fontWeight: FontWeight.bold);

  // Medium
  static const kMedium = TextStyle(
    fontFamily: kPrimaryFamily,
    fontSize: kMediumSize,
    color: KColor.kWhite,
  );
  static TextStyle kMediumBold = kMedium.copyWith(fontWeight: FontWeight.bold);

  // Large
  static const kLarge = TextStyle(
    fontFamily: kPrimaryFamily,
    fontSize: kLargeSize,
    color: KColor.kWhite,
  );
  static TextStyle kLargeBold = kLarge.copyWith(fontWeight: FontWeight.bold);
}

class KBMILevel {
  static const _kImageDir = "assets/images";
  static const level1 = <dynamic>[
    18.5,
    "Underweight 🌱",
    "$_kImageDir/underweight.png",
    "Being underweight may indicate insufficient body fat and muscle mass, which can lead to weakened immune function, nutrient deficiencies, and decreased energy levels. It's important for individuals in this weight class to focus on consuming a balanced diet to promote healthy weight gain and muscle development."
  ];
  static const level2 = <dynamic>[
    25.0,
    "Normal Weight 🌟",
    "$_kImageDir/normal.png",
    "A healthy weight range indicating balanced body composition, reducing the risk of chronic diseases. Maintain it with regular exercise and a balanced diet.",
  ];
  static const level3 = <dynamic>[
    30.0,
    "Overweight 🤔",
    "$_kImageDir/overweight.png",
    "Accumulated excess body weight, increasing the risk of heart disease, diabetes, and joint problems. Address it through healthy habits and gradual weight loss.",
  ];
  static const level4 = <dynamic>[
    40.0,
    "Obesity 🚧",
    "$_kImageDir/obesity.png",
    "Excessive body fat, with a BMI of 30 or higher. Raises the risk of heart disease, type 2 diabetes, cancer, and musculoskeletal disorders. Comprehensive management required for weight loss and reducing complications.",
  ];
  static const level5 = <dynamic>[
    null,
    "Severe Obesity 📈",
    "$_kImageDir/obesity.png",
    "BMI of 40 or higher, posing significant health risks like heart disease, diabetes, and decreased quality of life. Treatment involves lifestyle changes, medical interventions, and professional guidance for better health outcomes.",
  ];
}
