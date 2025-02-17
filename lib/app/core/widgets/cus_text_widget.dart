import 'package:symphony_app/app/core/constants/imports.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color = AppColor.bodyText,
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