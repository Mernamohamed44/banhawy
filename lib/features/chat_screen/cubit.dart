import 'package:bloc/bloc.dart';

import 'state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  ChatScreenCubit() : super(InitialState());
}
