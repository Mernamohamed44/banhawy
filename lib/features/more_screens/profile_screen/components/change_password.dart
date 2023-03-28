import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_text_field.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_cubit.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenCubit, ProfileScreenState>(builder: (context,state){
      var cubit=BlocProvider.of<ProfileScreenCubit>(context);
      return  ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10
        ),
        children:  [
          CustomTextField(
            secure: true,
            upperText: 'New Password',
            controller: cubit.newPasswordController,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomButton(
              raduis: 15,
              text: 'save',
              onPress: ()=>cubit.updatePassword(),
            ),
          )
        ],
      );
    });
  }
}
