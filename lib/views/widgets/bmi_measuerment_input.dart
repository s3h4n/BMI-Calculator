import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_icon_button.dart';
import 'package:zodz_bmi_calculator/views/widgets/slider_thumb_shapes.dart';

class BMIMeasurementInput extends StatefulWidget {
  const BMIMeasurementInput({
    Key? key,
    required this.label,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.decreaseValue,
    required this.increaseValue,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final double value;
  final double minValue;
  final double maxValue;
  final VoidCallback decreaseValue;
  final VoidCallback increaseValue;
  final ValueChanged<double> onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _BMIMeasurementInputState createState() => _BMIMeasurementInputState();
}

class _BMIMeasurementInputState extends State<BMIMeasurementInput> {
  SliderThemeData _sliderTheme(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.transparent,
      inactiveTrackColor: Colors.transparent,
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 64 - 2,
      thumbShape: WeightSliderThumbShape(
        thumbRadius: 2,
        min: 10,
        max: 210,
        sliderValue: widget.value,
      ),
      thumbColor: Colors.transparent,
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: KFont.kBody),
        KLayout.kAddHalfYGap,
        Container(
          decoration: const BoxDecoration(
            borderRadius: KLayout.kRadiusAll,
            color: KColor.kWhite,
          ),
          child: Row(
            children: [
              BMIIconButton(action: widget.decreaseValue, icon: Icons.remove),
              Expanded(
                child: SliderTheme(
                  data: _sliderTheme(context),
                  child: Slider(
                    value: widget.value,
                    min: widget.minValue,
                    max: widget.maxValue,
                    onChanged: (newValue) {
                      widget.onChanged(newValue);
                    },
                  ),
                ),
              ),
              BMIIconButton(action: widget.increaseValue, icon: Icons.add),
            ],
          ),
        ),
      ],
    );
  }
}
