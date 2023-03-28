import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/patient_home_model/patient_home_model.dart';
import 'package:bloc/bloc.dart';

import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(InitialSate());
  PatientHomeModel? patientHomeModel;
  void fetchHomeData() {
    emit(HomeLoadingSate());
    DioHelper.get('fetch_setting').then((value) {
      patientHomeModel = PatientHomeModel.fromJson(value.data);
      print('success');
      emit(HomeSuccessSate());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
