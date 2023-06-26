import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class BMISelectOption extends StatelessWidget {
  const BMISelectOption({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String text;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Ink(
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: MediaQuery.of(context).size.width / 2 - 72,
          decoration: BoxDecoration(
            color:
                isSelected ? KColor.kPrimaryColor.withAlpha(30) : KColor.kWhite,
            border: Border.all(
              color: isSelected ? KColor.kPrimaryColor : Colors.transparent,
            ),
            borderRadius: KLayout.kRadiusAll,
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
        const SizedBox(height: KLayout.kPrimarySpace / 2),
        Text(text, style: isSelected ? KFont.kBodyBold : KFont.kBody),
        const SizedBox(height: KLayout.kPrimarySpace / 2),
      ],
    );
  }
}
