import 'package:flutter/material.dart';

class CusTextWid extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;

  const CusTextWid({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
    this.fontFamily = 'Urbanist',
    this.fontWeight = FontWeight.w700,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
