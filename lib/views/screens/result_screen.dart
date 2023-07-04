import 'package:flutter/material.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';
import 'package:get/get.dart';
import 'package:zodz_bmi_calculator/models/user_model.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;
  final _bmiLabel = "BMI Score";
  final _ageLabel = "Age";
  final _heightLabel = "Height";
  final _weightLabel = "Weight";
  final _imageHeight = 200.0;
  final _background = KColor.kWhite;
  final _userCardStyle = const BoxDecoration(
    borderRadius: KLayout.kLargeRadiusAll,
    color: KColor.kPrimaryColor,
    // gradient: KColor.kPrimaryGradient,
  );
  final _weightCardStyle = const BoxDecoration(
    borderRadius: KLayout.kLargeRadiusAll,
    color: KColor.kBlack,
    // gradient: KColor.kBlackGradient,
  );
  final _weightCardTextStyle = KFont.kBodyDark;
  final _weightCardTitleStyle = KFont.kMediumBold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
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
                decoration: _weightCardStyle,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Obx(
                      () => Text(
                        user.bmiClass.value,
                        style: _weightCardTitleStyle,
                      ),
                    ),
                    Obx(
                      () => Text(
                        "BMI Value ${user.bmiValue}",
                        style: _weightCardTextStyle,
                      ),
                    ),
                    KLayout.kAddYGap,
                    Obx(() => Text(
                          user.bmiDescription.value,
                          style: _weightCardTextStyle,
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
