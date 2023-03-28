import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomContainer(text1: 'Languages', text2: ''),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: colorWhite,
                  border: Border.all(color: colorPrimary)),
              child: Row(
                children: [
                  const Spacer(),
                  const CustomText(
                    text: 'اللغه العربيه ',
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  SvgPicture.asset('assets/images/egypt.svg')
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.white)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/usa.svg'),
                  const SizedBox(
                    width: 7,
                  ),
                  const CustomText(
                    text: 'English ',
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
