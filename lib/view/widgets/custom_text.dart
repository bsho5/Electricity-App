import 'package:flutter/material.dart';
import 'dart:ui'as ui;
class CustomText extends StatelessWidget {
  CustomText({
    this.text = '',
    this.fontSize = 15,
    this.color = Colors.white,
    this.fontWeight, this.alignment,
  });
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        text ?? 'Default Value',
        style:
            TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
        textAlign: alignment,
        
      ),
    );
  }
}
