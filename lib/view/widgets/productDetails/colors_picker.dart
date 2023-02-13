import 'package:flutter/material.dart';

class ColorsPicker extends StatelessWidget {
  ColorsPicker({Key? key, required this.outerBorder, required this.color,}) : super(key: key);

  final bool outerBorder;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder ? Border.all(color: color, width: 2,) : null,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
