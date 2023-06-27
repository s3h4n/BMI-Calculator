import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'package:get/get.dart';
import 'package:zodz_bmi_calculator/models/user_model.dart';
import 'package:zodz_bmi_calculator/views/widgets/bmi_appbar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;
  final String _screenTitle = "BMI Results";
  final String _bmiLabel = "BMI Score";
  final String _ageLabel = "Age";
  final String _heightLabel = "Height";
  final String _weightLabel = "Weight";
  final double _imageHeight = 200.0;
  final BoxDecoration _userCardStyle = const BoxDecoration(
    borderRadius: KLayout.kLargeRadiusAll,
    color: KColor.kPrimaryColor,
    // gradient: KColor.kPrimaryGradient,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.kAccentColor,
      appBar: BMIAppBar(title: _screenTitle),
      body: SingleChildScrollView(
        child: Container(
          margin: KLayout.kMarginAll,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User's information card
              Container(
                width: double.maxFinite,
                padding: KLayout.kLargePaddingAll,
                decoration: _userCardStyle,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // User's name and address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User's BMI score, name, and address
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    user.name.value.capitalize.toString(),
                                    style: KFont.kMediumBold,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "${user.addressLine1.value}, ${user.addressLine2.value}, ${user.town.value}."
                                        .capitalize
                                        .toString(),
                                    style: KFont.kBodyDark,
                                    overflow: TextOverflow.fade,
                                    maxLines: 2,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),
                            KLayout.kAddYGap,

                            // User's BMI score animated.
                            TweenAnimationBuilder<double>(
                              tween: Tween(begin: 0.0, end: user.getBMIValue()),
                              duration: const Duration(milliseconds: 1000),
                              builder: (context, value, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      value.toStringAsFixed(2),
                                      style: KFont.kLargeBold,
                                    ),
                                    Text(
                                      _bmiLabel,
                                      style: KFont.kBodyDark,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                        KLayout.kAddXGap,

                        // User's weight class representation image
                        Obx(() => Image.asset(
                              user.bmiImage.value,
                              height: _imageHeight,
                            )),
                      ],
                    ),

                    KLayout.kAddYGap,

                    // User's age, height & weight
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${user.getAge()} yrs",
                                style: KFont.kMediumBold,
                              ),
                              Text(
                                _ageLabel,
                                style: KFont.kBodyDark,
                              ),
                            ],
                          ),
                          KLayout.kAddYDivider,
                          Column(
                            children: [
                              Text(
                                "${user.height.value.round()} cm",
                                style: KFont.kMediumBold,
                              ),
                              Text(
                                _heightLabel,
                                style: KFont.kBodyDark,
                              ),
                            ],
                          ),
                          KLayout.kAddYDivider,
                          Column(
                            children: [
                              Text(
                                "${user.weight.value.round()} kg",
                                style: KFont.kMediumBold,
                              ),
                              Text(
                                _weightLabel,
                                style: KFont.kBodyDark,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              KLayout.kAddYGap,

              // Weight class information card
              Container(
                padding: KLayout.kLargePaddingAll,
                decoration: const BoxDecoration(
                  color: KColor.kWhite,
                  // gradient: KColor.kBlackGradient,
                  borderRadius: KLayout.kLargeRadiusAll,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () => Text(
                        user.bmiClass.value,
                        style: KFont.kMediumBold
                            .copyWith(color: KColor.kPrimaryColor),
                      ),
                    ),
                    Obx(
                      () => Text(
                        "BMI Value ${user.bmiValue}",
                      ),
                    ),
                    KLayout.kAddYGap,
                    Obx(() => Text(
                          user.bmiDescription.value,
                        )),
                  ],
                ),
              ),
              KLayout.kAddYGap,
            ],
          ),
        ),
      ),
    );
  }
}
