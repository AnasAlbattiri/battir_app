import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  const TextUtils(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color})
      : super(key: key);

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
