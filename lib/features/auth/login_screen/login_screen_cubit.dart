import 'package:banhawy/common_component/show_snack_bar.dart';
import 'package:banhawy/core/app_storage/app_storage.dart';
import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/users_model/user_model.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(InitState());
  bool? value = false;
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  var fKey = GlobalKey<FormState>();
  void checkBookChange(bool? val) {
    value = val;
    emit(CheckBookChangeState());
  }

  UserModel? userModel;

  login() {
    final token = FirebaseMessaging.instance.getToken();

    if (fKey.currentState!.validate()) {
      fKey.currentState!.save();
    }
    emit(UserLoginLoadingState());
    final body = {
      'code': code.text,
      'password': password.text,
      'device_token': token,
      'device_type': 'android'
    };
     DioHelper.post('login', false, body: body).then((value) {
      userModel = UserModel.fromJson(value.data);
      if(value.data['status']==true){
        AppStorage.cacheUserInfo(userModel!);
        MagicRouter.navigateAndPopAll(const BottomNavigationBarPage());
      }
      else{
       showSnackBar(userModel!.message!);
      }
      print('success');
      emit(UserLoginSuccessState());
    }).catchError((error) {
      print('error is ${error.toString()}');
      emit(UserLoginErrorState());
    });
  }
}
