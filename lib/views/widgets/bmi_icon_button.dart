import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class BMIIconButton extends StatelessWidget {
  const BMIIconButton({
    Key? key,
    required this.icon,
    required this.action,
  }) : super(key: key);

  final IconData icon;
  final void Function()? action;
  final double _buttonHeight = 64.0;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        fixedSize: MaterialStateProperty.all(Size.fromHeight(_buttonHeight)),
        foregroundColor: MaterialStateProperty.all(KColor.kPrimaryColor),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: KLayout.kRadiusAll),
        ),
      ),
      child: Icon(icon),
    );
  }
}
