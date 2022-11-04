import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF0A0E21)),
          //canvasColor: Color(0xff111428),
          scaffoldBackgroundColor: Color(0xff111428),
          textTheme: const TextTheme(
              //bodyText1: TextStyle(color: Colors.white,) ,
              bodyText2: TextStyle(
            color: Colors.white,
          ))),
      home: InputPage(),
    );
  }
}
