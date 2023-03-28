import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/doctor_model/doctor_model.dart';
import 'package:bloc/bloc.dart';

import 'profile_doctor_screen_state.dart';

class ProfileDoctorScreenCubit extends Cubit<ProfileDoctorScreenState> {
  ProfileDoctorScreenCubit() : super(InitialState());
  DoctorsModel? doctorsModel;
  void fetchProfileData() {
    emit(FetchProfileLoadingDoctorState());
    DioHelper.post('fetch_doctor',false,body: {'doctor_id': '3'} ).then((value) {
      doctorsModel = DoctorsModel.fromJson(value.data);
      print('profileDoctor');
      emit(FetchProfileDoctorSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(FetchProfileErrorState());
    });
  }
}
