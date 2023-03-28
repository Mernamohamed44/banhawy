import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/common_component/custom_text_field.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/auth/login_screen/login_screen_cubit.dart';
import 'package:banhawy/features/auth/login_screen/login_screen_state.dart';
import 'package:banhawy/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<LoginScreenCubit>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Form(
              key: cubit.fKey,
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                children: [
                  Image.asset('assets/images/logo11.png'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .06,
                  ),
                  CustomText(

                    text: 'Login',
                    color: colorPrimary,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomTextField(
                    fillColor: colorWhite,
                    upperText: 'code',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: colorPrimary,
                    ),
                    controller: cubit.code,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'حقل فارغ';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    fillColor: colorWhite,
                    secure: true,
                    upperText: 'password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: colorPrimary,
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'حقل فارغ';
                      }
                      return null;
                    },
                    controller: cubit.password,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          checkColor: colorGrey,
                          focusColor: colorGrey,
                          activeColor: colorWhite,
                          autofocus: true,
                          value: cubit.value,
                          onChanged: (val) {
                            cubit.checkBookChange(val);
                          }),
                      CustomText(
                        text: 'remember me',
                        color: colorGrey,
                        fontSize: 14,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  state is UserLoginLoadingState
                      ? Center(child: Image.asset('assets/images/Loading.gif'))
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: CustomButton(
                            text: 'Login',
                            raduis: 15,
                            onPress: () {
                              cubit.login();
                            },
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
