import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'package:zodz_bmi_calculator/models/user_model.dart';
import 'package:zodz_bmi_calculator/views/screens/result_screen.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_appbar.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_calculate_btn.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_date_picker.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_drawer.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_measuerment_input.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_select_gender.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_text_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserModel user = UserModel();

  final String _uDOBLabel = "Date of Birth";
  final String _uNameLabel = "Your Name";
  final String _uAddrLine1Label = "Address Line 01";
  final String _uAddrLine2Label = "Address Line 02";
  final String _uAddrTownLabel = "Town";
  final String _uGenderLabel = "Gender";
  final String _uGenderMaleLabel = "Male";
  final String _uGenderFemaleLabel = "Female";
  final String _uGenderMaleImage = "assets/images/maleavatar.png";
  final String _uGenderFemaleImage = "assets/images/femaleavatar.png";
  final String _uWeightLabel = "Weight (kg)";
  final String _uHeightLabel = "Height (cm)";
  final double _minWeightValue = 10.0;
  final double _maxWeightValue = 210.0;
  final double _minHeightValue = 80.0;
  final double _maxHeightValue = 280.0;

  final TextEditingController _uDOBController = TextEditingController();
  final TextEditingController _uNameController = TextEditingController();
  final TextEditingController _uAddrLine1Controller = TextEditingController();
  final TextEditingController _uAddrLine2Controller = TextEditingController();
  final TextEditingController _uAddrTownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: KColor.kAccentColor,
        appBar: const BMIAppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: KLayout.kMarginAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Get user's name.
                BMITextInput(
                  label: _uNameLabel,
                  controller: _uNameController,
                  type: TextInputType.name,
                  onChange: (value) => user.name.value = _uNameController.text,
                ),
                KLayout.kAddYGap,

                /// Get user's address line 1.
                BMITextInput(
                  label: _uAddrLine1Label,
                  controller: _uAddrLine1Controller,
                  type: TextInputType.streetAddress,
                  max: 32,
                  onChange: (value) =>
                      user.addressLine1.value = _uAddrLine1Controller.text,
                ),
                KLayout.kAddYGap,

                /// Get user's address line 2.
                BMITextInput(
                  label: _uAddrLine2Label,
                  controller: _uAddrLine2Controller,
                  type: TextInputType.streetAddress,
                  max: 32,
                  onChange: (value) =>
                      user.addressLine2.value = _uAddrLine2Controller.text,
                ),
                KLayout.kAddYGap,

                /// Get user's address town.
                BMITextInput(
                  label: _uAddrTownLabel,
                  controller: _uAddrTownController,
                  type: TextInputType.streetAddress,
                  max: 32,
                  onChange: (value) =>
                      user.town.value = _uAddrTownController.text,
                ),
                KLayout.kAddYGap,

                /// Get user's date of birth.
                BMIDateTimePicker(
                  label: _uDOBLabel,
                  controller: _uDOBController,
                  onChange: (value) => user.dob.value = value,
                ),
                KLayout.kAddYGap,

                /// Get user's gender.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_uGenderLabel, style: KFont.kBody),
                    KLayout.kAddHalfYGap,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BMISelectOption(
                          imagePath: _uGenderMaleImage,
                          text: _uGenderMaleLabel,
                          isSelected: user.gender.value == 1,
                          onTap: () {
                            setState(() {
                              user.gender.value = 1;
                            });
                            debugPrint(user.gender.value.toString());
                          },
                        ),
                        BMISelectOption(
                          imagePath: _uGenderFemaleImage,
                          text: _uGenderFemaleLabel,
                          isSelected: user.gender.value == 0,
                          onTap: () {
                            setState(() {
                              user.gender.value = 0;
                            });
                            debugPrint(user.gender.value.toString());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                KLayout.kAddYGap,

                /// Get user's weight.
                Obx(
                  () => BMIMeasurementInput(
                    label: _uWeightLabel,
                    value: user.weight.value,
                    minValue: _minWeightValue,
                    maxValue: _maxWeightValue,
                    decreaseValue: () {
                      if (user.weight.value > _minWeightValue) {
                        user.weight.value--;
                      }
                      debugPrint(user.weight.value.toString());
                    },
                    increaseValue: () {
                      if (user.weight.value < _maxWeightValue) {
                        user.weight.value++;
                      }
                      debugPrint(user.weight.value.toString());
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          user.weight.value = value;
                          debugPrint(user.weight.value.toString());
                        },
                      );
                    },
                  ),
                ),
                KLayout.kAddYGap,

                /// Get user's height.
                Obx(
                  () => BMIMeasurementInput(
                    label: _uHeightLabel,
                    value: user.height.value,
                    minValue: _minHeightValue,
                    maxValue: _maxHeightValue,
                    decreaseValue: () {
                      if (user.height.value > _minHeightValue) {
                        user.height.value--;
                      }
                      debugPrint(user.height.value.toString());
                    },
                    increaseValue: () {
                      if (user.height.value < _maxHeightValue) {
                        user.height.value++;
                      }
                      debugPrint(user.height.value.toString());
                    },
                    onChanged: (value) {
                      setState(
                        () {
                          user.height.value = value;
                          debugPrint(user.height.value.toString());
                        },
                      );
                    },
                  ),
                ),
                KLayout.kAddYGap,
              ],
            ),
          ),
        ),

        /// Drawer to display app information.
        endDrawer: const BMIDrawer(),

        /// Create a bottom navigation bar which holds a button to next screen.
        bottomNavigationBar: Container(
          color: KColor.kAccentColor,
          padding: KLayout.kPaddingAll,
          child: BMICalculateButton(
            onClick: () {
              /// If all input fields are not empty.
              if (_uDOBController.text.trim().isNotEmpty &&
                  _uNameController.text.trim().isNotEmpty &&
                  _uAddrLine1Controller.text.trim().isNotEmpty &&
                  _uAddrLine2Controller.text.trim().isNotEmpty &&
                  _uAddrTownController.text.trim().isNotEmpty &&
                  user.gender.value != 3) {
                /// Update users results.
                user.update();

                /// Open results screen in a bottom sheet.
                showModalBottomSheet(
                  backgroundColor: KColor.kAccentColor,
                  isScrollControlled: true,
                  enableDrag: true,
                  barrierColor: KColor.kAccentColor,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return ResultScreen(user: user);
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      elevation: 0,
                      child: Container(
                        padding: KLayout.kLargePaddingAll,
                        alignment: Alignment.center,
                        height: 164,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.error,
                              color: KColor.kPrimaryColor,
                              size: 64,
                            ),
                            KLayout.kAddYGap,
                            Text(
                              "Please fill out all the details.",
                              style: KFont.kBody,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
