import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_icon_button.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_slider_thumb_shapes.dart';

/// A widget for BMI measurement input in the BMI Calculator app.
class BMIMeasurementInput extends StatefulWidget {
  /// Creates a custom [BMIMeasurementInput].
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

  /// The label for the measurement input.
  final String label;

  /// The current value of the measurement.
  final double value;

  /// The minimum value of the measurement.
  final double minValue;

  /// The maximum value of the measurement.
  final double maxValue;

  /// The callback function to decrease the measurement value.
  final VoidCallback decreaseValue;

  /// The callback function to increase the measurement value.
  final VoidCallback increaseValue;

  /// The callback function to execute when the measurement value changes.
  final ValueChanged<double> onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _BMIMeasurementInputState createState() => _BMIMeasurementInputState();
}

class _BMIMeasurementInputState extends State<BMIMeasurementInput> {
  /// The background color of the widget.
  final _background = KColor.kWhite;

  /// The border radius of the widget.
  final _radius = KLayout.kRadiusAll;

  /// Creates a custom SliderThemeData object to customize the slider.
  SliderThemeData _sliderTheme(BuildContext context) {
    return SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.transparent,
      inactiveTrackColor: Colors.transparent,
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 64 - 2,
      thumbShape: BMISliderThumbShape(
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
          decoration: BoxDecoration(
            borderRadius: _radius,
            color: _background,
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
                    onChanged: (newValue) => widget.onChanged(newValue),
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
