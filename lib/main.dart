import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/calculate_bmi_screen.dart';
import 'screens/info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: CalculateScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => CalculateScreen()),
        GetPage(name: '/info', page: () => InfoScreen()),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor:
            Color.fromARGB(255, 149, 202, 225), // Navy Blue
      ),
    );
  }
}
