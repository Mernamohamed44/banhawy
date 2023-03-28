import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/patients_doctor_model/patients_doctor_model.dart';
import 'package:bloc/bloc.dart';

import 'my_doctor_screen_state.dart';

class MyDoctorCubit extends Cubit<MyDoctorState> {
  MyDoctorCubit() : super(InitialState());
  HomeDoctors ?homeDoctors;
  void fetchDoctors(){
    emit(FetchDoctorLoadingState());
    DioHelper.get('fetch_patient_doctor').then((value){
      homeDoctors=HomeDoctors.fromJson(value.data);
      print('doctors success');
      emit(FetchDoctorSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(FetchDoctorErrorState());
    });
  }
}
