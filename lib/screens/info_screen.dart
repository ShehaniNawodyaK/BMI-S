import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bmi_controller.dart';

class InfoScreen extends StatelessWidget {
  final BMIController bmiController = Get.find();

  @override
  Widget build(BuildContext context) {
    double actualBmi = bmiController.bmiResult.value;
    String userCategory = getCategory(actualBmi);
    String message = getHealthMessage(userCategory);

    return Scaffold(
      appBar: AppBar(title: Text('BMI Information')),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 39, 49, 201),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Your Category: $userCategory',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCategoryTable(),
                    SizedBox(height: 20),
                    _buildRectangleMessage(message),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFD4F1F4),
                      ),
                      child: Text('Back'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 15.0,
            right: 15.0,
            child: Image.asset(
              'assets/images/logo2.png',
              width: 160.0,
              height: 160.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTable() {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('BMI Category', header: true),
            ),
            TableCell(
              child: _buildTableCell('BMI Assessment (kg/m^2)', header: true),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Severe undernourishment', rowIndex: 1),
            ),
            TableCell(
              child: _buildTableCell('< 16', rowIndex: 1),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Medium undernourishment', rowIndex: 2),
            ),
            TableCell(
              child: _buildTableCell('16 - 16.9', rowIndex: 2),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Slight undernourishment', rowIndex: 3),
            ),
            TableCell(
              child: _buildTableCell('17 - 18.4', rowIndex: 3),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Normal nutrition state', rowIndex: 4),
            ),
            TableCell(
              child: _buildTableCell('18.5 - 24.9', rowIndex: 4),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Overweight', rowIndex: 5),
            ),
            TableCell(
              child: _buildTableCell('25 - 29.9', rowIndex: 5),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Obesity', rowIndex: 6),
            ),
            TableCell(
              child: _buildTableCell('30 - 39.9', rowIndex: 6),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: _buildTableCell('Pathologic obesity', rowIndex: 7),
            ),
            TableCell(
              child: _buildTableCell('> 40', rowIndex: 7),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableCell(String text, {bool header = false, int rowIndex = 0}) {
    final backgroundColor = header
        ? Color.fromARGB(255, 84, 84, 85)
        : (rowIndex % 2 == 0 ? Colors.white : Colors.grey[200]);

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: backgroundColor,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: header ? FontWeight.bold : FontWeight.normal,
          color: header ? Colors.white : Colors.black,
          fontSize: header ? 16.0 : 14.0,
        ),
      ),
    );
  }

  Widget _buildRectangleMessage(String message) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 78, 110, 142),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(16),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  String getCategory(double bmi) {
    if (bmi < 16) {
      return 'Severe undernourishment';
    } else if (bmi >= 16 && bmi < 17) {
      return 'Medium undernourishment';
    } else if (bmi >= 17 && bmi < 18.5) {
      return 'Slight undernourishment';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Normal nutrition state';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi <= 39.9) {
      return 'Obesity';
    } else {
      return 'Pathologic obesity';
    }
  }

  String getHealthMessage(String category) {
    switch (category) {
      case 'Severe undernourishment':
        return 'You may be severely undernourished. Seek immediate medical attention for a balanced nutrition plan.';
      case 'Medium undernourishment':
        return 'Medium undernourishment detected. Consult a healthcare professional for nutritional guidance.';
      case 'Slight undernourishment':
        return 'Slight undernourishment observed. Consider talking to a nutritionist for dietary recommendations.';
      case 'Normal nutrition state':
        return 'You\'re in a normal nutrition state. Maintain a balanced lifestyle for overall well-being.';
      case 'Overweight':
        return 'Overweight status detected. Consider healthy lifestyle changes for better weight management.';
      case 'Obesity':
        return 'Obesity status detected. Discuss weight management strategies with a healthcare professional.';
      case 'Pathologic obesity':
        return 'Pathologic obesity identified. Seek immediate medical advice for a comprehensive health plan.';
      default:
        return '';
    }
  }
}
