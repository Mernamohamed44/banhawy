import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/core/app_storage/app_storage.dart';
import 'package:banhawy/core/router/router.dart';

import 'package:banhawy/features/more_screens/components/more_container.dart';
import 'package:banhawy/features/more_screens/languages/languages_screen.dart';
import 'package:banhawy/features/more_screens/privacy/privacy_screen.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_view.dart';
import 'package:banhawy/features/more_screens/questions/questions.dart';

import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';

class MoreScreenView extends StatelessWidget {
  const MoreScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            // vertical: 35
          ),
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36)),
            color: colorPrimary,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: AppStorage.getUserInfo!.data!.name!,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colorWhite,
                ),
                CustomText(
                  text: AppStorage.getUserInfo!.data!.email!,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colorWhite,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .05,
        ),
        InkWell(
            onTap: () => MagicRouter.navigateTo(ProfileScreen()),
            child: const MoreContainer(
              txt: 'Profile',
            )),
        InkWell(
            onTap: () => MagicRouter.navigateTo(LanguagesScreen()),
            child: const MoreContainer(
              txt: 'Languages',
            )),
        InkWell(
            onTap: () => MagicRouter.navigateTo(PrivacyScreen()),
            child: const MoreContainer(
              txt: 'Privacy',
            )),
        InkWell(
            onTap: () => MagicRouter.navigateTo(Questions()),
            child: const MoreContainer(
              txt: 'FAQ Questions',
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/log.png',
                color: Colors.red,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * .01,
              ),
              InkWell(
                onTap: () => AppStorage.signOut(),
                child: const CustomText(
                  text: 'Sign out',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
