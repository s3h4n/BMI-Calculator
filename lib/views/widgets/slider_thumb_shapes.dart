import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

class WeightSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;
  final double sliderValue;

  WeightSliderThumbShape({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
    required this.sliderValue,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = KColor.kWhite
      ..style = PaintingStyle.fill;

    final double thumbPosition = (parentBox.size.width / 2) - thumbRadius;

    final textSpan = TextSpan(
      style: KFont.kBodyBold.copyWith(color: KColor.kBlack, fontSize: 20),
      text: getValue(sliderValue),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final textCenter = Offset(
      thumbPosition - (textPainter.width / 2),
      center.dy - (textPainter.height / 2),
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(thumbPosition, center.dy),
          width: 64,
          height: 64,
        ),
        const Radius.circular(KLayout.kPrimaryRadius),
      ),
      paint,
    );
    textPainter.paint(canvas, textCenter);
  }

  String getValue(double value) {
    final currentValue = value.round();
    return '$currentValue';
  }
}
