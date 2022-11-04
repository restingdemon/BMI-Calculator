import 'package:flutter/material.dart';
import 'constants.dart';
class CustomIconContent extends StatelessWidget {
  CustomIconContent({required this.icon, required this.string});
  IconData icon;
  String string;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 75.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          string,
          style: kLabelTextStyle
        )
      ],
    );
  }
}