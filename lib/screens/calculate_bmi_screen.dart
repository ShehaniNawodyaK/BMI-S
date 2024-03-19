import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bmi_controller.dart';
import 'info_screen.dart';

class CalculateScreen extends StatelessWidget {
  final BMIController bmiController = Get.put(BMIController());
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final RxBool showBMI = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 200,
            ),
            SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Height (meters)',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double height = double.tryParse(heightController.text) ?? 0.0;
                double weight = double.tryParse(weightController.text) ?? 0.0;

                // Update BMIController with height and weight
                bmiController.height.value = height;
                bmiController.weight.value = weight;

                // Calculate BMI
                bmiController.calculateBMI();

                // Show BMI value
                showBMI.value = true;

                print("BMI Calculated: ${bmiController.bmiResult}");

                // Debug: Check if onPressed is triggered
                print("Calculate Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFD4F1F4), // Baby Blue
              ),
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Obx(() {
              if (showBMI.value) {
                return Text('BMI: ${bmiController.bmiResult}');
              } else {
                return SizedBox.shrink();
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Information screen only if BMI is calculated
                if (showBMI.value) {
                  Get.to(() => InfoScreen());

                  // Debug: Check if onPressed is triggered
                  print("Next Button Pressed");
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFD4F1F4), // Baby Blue
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
