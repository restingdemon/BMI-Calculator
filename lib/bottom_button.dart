import 'package:flutter/material.dart';
import 'result_page.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({this.string,this.onpressed});
  String? string;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Center(
          child: Text(string!,
              style: klargebuttonstyle, textAlign: TextAlign.center),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        height: 80,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}