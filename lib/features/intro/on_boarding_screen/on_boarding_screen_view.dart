import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/auth/login_screen/login_screen_view.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreenViews extends StatelessWidget {
  OnBoardingScreenViews({Key? key}) : super(key: key);
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: 'For better health',
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Health "),
        ],
      ),
      image: Image.asset('assets/images/board1.png'),
    ),
    PageViewModel(
      title: 'For better health',
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Health "),
        ],
      ),
      image: Image.asset('assets/images/board2.png'),
    ),
    PageViewModel(
      title: 'For better health',
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Health "),
        ],
      ),
      image: Image.asset('assets/images/board3.png'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: IntroductionScreen(
         dotsFlex: 2,
          showSkipButton: true,
          skipOrBackFlex: 2,
          pages: listPagesViewModel,
          next: const CustomButton(
            text: 'Next',
            raduis: 20,
          ),
          skip: const CustomButton(
            text: 'Skip',
            raduis: 20,
          ),
          done: CustomButton(
            text: 'Done',
            raduis: 20,
            borderColor: colorGrey,
            bgColor: colorGrey,
          ),
          nextFlex: 2,
          back: CustomButton(
            text: 'Back',
            raduis: 20,
            borderColor: colorGrey,
            bgColor: colorGrey,
          ) ,
          onDone: () {
            MagicRouter.navigateAndPopAll(LoginScreenView());
          },
          onSkip: () {
            MagicRouter.navigateAndPopAll(LoginScreenView());
          },
        ),
      ),
    );
  }
}
