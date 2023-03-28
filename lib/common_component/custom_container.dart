import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/chat_screen/view.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.text1, required this.text2}) : super(key: key);
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        // vertical: 35
      ),
      height: MediaQuery.of(context).size.height * .15,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(36),
            bottomRight: Radius.circular(36)),
        color: colorPrimary,
      ),
      child: Row(
        children: [
          RichText(
              text:  TextSpan(children: [
                TextSpan(
                    text: text1,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                TextSpan(text: text2, style: TextStyle(fontSize: 16))
              ])),
          //const Spacer(),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/notification.svg',
                color: colorWhite,
              )),
          IconButton(
              onPressed: ()=>MagicRouter.navigateTo(ChatScreenPage()),
              icon: SvgPicture.asset(
                'assets/images/message.svg',
                color: colorWhite,
              ))
        ],
      ),
    );
  }
}
