import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'cubit.dart';

class ChatScreenPage extends StatelessWidget {
  const ChatScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatScreenCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar:  AppBar(
            title: const CustomText(
              text: 'Chat',
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: colorPrimary,
          ),
          body: Row(
            children: [
              // CircleAvatar(
              //   child: SvgPicture.asset('assets/images/1.svg'),
              // ),
               Column(
                 children: const [
                   CustomText(
                     text: 'Merna Mohamed',
                   )
                 ],
               )
            ],
          )
        );
      }),
    );
  }

}
