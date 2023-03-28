import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    this.text = '',
    this.color,
    this.onPressed,
    this.alignment,
    this.fontWeight,
    this.textDecoration,
    this.fontSize = 14,
  }) : super(key: key);
  final String text;
  final Color? color;
  final VoidCallback? onPressed;
  final Alignment? alignment;
  final FontWeight? fontWeight;
  final double fontSize;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            decoration: textDecoration ?? TextDecoration.none,
            color: color ?? colorPrimary,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
