
import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/core/models/home_operations_model/home_operation_model.dart';
import 'package:bloc/bloc.dart';

import 'my_operation_state.dart';

class MyOperationCubit extends Cubit<MyOperationState> {
  MyOperationCubit() : super(InitialState());
  HomeOperation ? homeOperation;
  void fetchOperation(){
    emit(OperationLoadingState());
    DioHelper.get('fetch_home_operation').then((value){
      homeOperation=HomeOperation.fromJson(value.data);
      print('operation success');
      emit(OperationSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(OperationErrorState());
    });
  }
}
