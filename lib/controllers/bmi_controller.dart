import 'package:get/get.dart';

class BMIController extends GetxController {
  RxDouble height = 0.0.obs;
  RxDouble weight = 0.0.obs;
  RxDouble bmiResult = 0.0.obs;

  void calculateBMI() {
    if (height.value > 0 && weight.value > 0) {
      double bmi = weight.value / (height.value * height.value);
      bmiResult.value = bmi;
    }
  }
}
