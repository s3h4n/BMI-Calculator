import 'package:get/get.dart';
import 'package:zodz_bmi_calculator/constants/const.dart';

/// Represents a user in the BMI calculator.
class UserModel {
  UserModel({
    name,
    addressLine1,
    addressLine2,
    town,
    dob,
    gender,
    height,
    weight,
  });

  // Observable variables using GetX for reactivity
  var name = "".obs;
  var addressLine1 = "".obs;
  var addressLine2 = "".obs;
  var town = "".obs;
  var dob = "".obs;
  var gender = 3.obs;
  var height = 172.0.obs;
  var weight = 60.0.obs;
  var bmiValue = 0.0.obs;
  var bmiClass = "".obs;
  var bmiDescription = "".obs;
  var bmiImage = "".obs;

  /// Calculates and returns the BMI value based on the user's weight and height.
  double getBMIValue() {
    double result = weight / ((height / 100) * (height / 100));
    return double.parse(result.toStringAsFixed(2));
  }

  /// Calculates and returns the age of the user based on their date of birth.
  int getAge() {
    DateTime currentDate = DateTime.now();
    List<String> dobParts = dob.split("-");
    int birthYear = int.parse(dobParts[0]);
    int birthMonth = int.parse(dobParts[1]);
    int birthDay = int.parse(dobParts[2]);

    int age = currentDate.year - birthYear;

    if (currentDate.month < birthMonth ||
        (currentDate.month == birthMonth && currentDate.day < birthDay)) {
      age--;
    }

    return age;
  }

  /// Updates the BMI-related properties based on the calculated BMI value.
  void update() {
    bmiValue.value = getBMIValue();
    if (bmiValue < KBMILevel.level1[0]) {
      bmiClass.value = KBMILevel.level1[1];
      bmiImage.value = KBMILevel.level1[2];
      bmiDescription.value = KBMILevel.level1[3];
    } else if (bmiValue < KBMILevel.level2[0]) {
      bmiClass.value = KBMILevel.level2[1];
      bmiImage.value = KBMILevel.level2[2];
      bmiDescription.value = KBMILevel.level2[3];
    } else if (bmiValue < KBMILevel.level3[0]) {
      bmiClass.value = KBMILevel.level3[1];
      bmiImage.value = KBMILevel.level3[2];
      bmiDescription.value = KBMILevel.level3[3];
    } else if (bmiValue < KBMILevel.level4[0]) {
      bmiClass.value = KBMILevel.level4[1];
      bmiImage.value = KBMILevel.level4[2];
      bmiDescription.value = KBMILevel.level4[3];
    } else {
      bmiClass.value = KBMILevel.level5[1];
      bmiImage.value = KBMILevel.level5[2];
      bmiDescription.value = KBMILevel.level5[3];
    }
  }
}
