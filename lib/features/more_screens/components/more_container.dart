import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';

class MoreContainer extends StatelessWidget {
  const MoreContainer({Key? key, required this.txt}) : super(key: key);
  final String txt;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: colorGrey
            )
        ),
        child: Row(
          children: [
            CustomText(
              text: txt,
              fontWeight: FontWeight.bold,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
