import 'package:banhawy/common_component/show_snack_bar.dart';
import 'package:banhawy/core/app_storage/app_storage.dart';
import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/city_model/city_model.dart';
import 'package:banhawy/core/models/users_model/user_model.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'profile_screen_state.dart';

class ProfileScreenCubit extends Cubit<ProfileScreenState> {
  ProfileScreenCubit() : super(InitialState());
  var addressController =
      TextEditingController(text: AppStorage.getUserInfo!.data!.address!);
  var nameController =
      TextEditingController(text: AppStorage.getUserInfo!.data!.name);
  var emailController =
      TextEditingController(text: AppStorage.getUserInfo!.data!.email!);

  var codeController =
      TextEditingController(text: AppStorage.getUserInfo!.data!.code);
  var phoneController =
      TextEditingController(text: AppStorage.getUserInfo!.data!.phone);
  var dateController =
      TextEditingController(text: AppStorage.getUserInfo!.data!.birthday);
  var newPasswordController = TextEditingController();
  var genderController = TextEditingController(text: AppStorage.getUserInfo!.data!.gender==1?'Female':'Male');
  List<String> gender = ['female', 'male'];
  void updateProfileData() {
    emit(UpdateProfileScreenLoadingState());
    final body = {
      'name': nameController.text,
      'state': '1',
      'city': '1',
      'gender': '2',
      'birthday': dateController.text,
      'address': addressController.text,
      'email':emailController.text,
      'phone':phoneController.text
    };
    DioHelper.post('patient_change_info', true, body: body).then((value) {
      if (value.data['status'] == true) {
        UserModel userModel = UserModel.fromJson(value.data);
        print(body);
        print("dataa${value.data}");
        AppStorage.cacheUserInfo(userModel);
        showSnackBar((value.data['message']));
        emit(UpdateProfileScreenSuccessState());
      } else {
        showSnackBar(value.data['message']);
        emit(UpdateProfileScreenErrorState());
      }
    }).catchError((error) {
      print('error is ${error.toString()}');
      emit(UpdateProfileScreenErrorState());
    });
  }

  CityModel? cityModel;
  void fetchCities() {
    DioHelper.post('fetch_city', true, body: {}).then((value) {
      cityModel = CityModel.fromJson(value.data);
      emit(FetchCitySuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FetchCityErrorState());
    });
  }

  void changeAddress(index) {
    addressController.text = cityModel!.data![index].title!;
    MagicRouter.pop();
    emit(ChangeAddressState());
  }

  void changeGender(index) {
    genderController.text = gender[index];
    MagicRouter.pop();
    emit(ChangeAddressState());
  }

  DateTime selectedDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      emit(ChangePickedDateState());
    }
  }

  void updatePassword() {
    emit(UpdatePasswordLoadingState());
    var body = {'new_password': newPasswordController.text};
    DioHelper.post('change_info_password', true, body: body).then((value) {
      if (value.data['status'] == true) {
        showSnackBar((value.data['message']));
        emit(UpdatePasswordSuccessState());
      } else {
        showSnackBar(value.data['message']);
        emit(UpdatePasswordErrorState());
      }
      print('update success');
    }).catchError((error) {
      print(error.toString());
      emit(UpdatePasswordErrorState());
    });
  }
}
