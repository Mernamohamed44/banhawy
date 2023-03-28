import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';


import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.text = '',
      this.fontSize = 16,
      this.onPress,
      this.widthButton,
      this.heightButton,
      this.isBold = true,
      this.isIcon = false,
      this.icon,
      this.bgColor,
      this.borderColor,
      this.raduis = 24,
      this.fontColor = Colors.white})
      : super(key: key);

  final String text;
  final double fontSize;
  final bool isBold;
  final double raduis;

  final VoidCallback? onPress;
  final double? widthButton;
  final double? heightButton;
  final bool isIcon;
  final Widget? icon;
  final Color? bgColor;
  final Color? borderColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: widthButton,
        height: heightButton ?? MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: bgColor ?? colorPrimary,
          borderRadius: BorderRadius.circular(raduis),
          border: Border.all(color: borderColor ?? colorPrimary, width: 1),
        ),
        //
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon == true ? icon! : const SizedBox(),
            isIcon == true
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  )
                : const SizedBox(),
            CustomText(
              text: text,
              fontSize: fontSize,
              color: fontColor,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'Montserrat',
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
