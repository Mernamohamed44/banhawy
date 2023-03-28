import 'package:banhawy/features/home_screen/home_screen_view.dart';
import 'package:banhawy/features/more_screens/more_screen_views.dart';
import 'package:banhawy/features/my_doctors/my_doctors_screen_view.dart';
import 'package:banhawy/features/my_operation/my_operation_screen_view.dart';
import 'package:banhawy/public/style.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(InitialState());
  int currentIndex=0;
  void changeNavigationBottom(index) {
    currentIndex = index;
    emit(ChangeBottomNavigationState());
  }
  List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(
      icon:  SvgPicture.asset('assets/images/home.svg'),
      activeIcon: SvgPicture.asset('assets/images/home.svg',color: colorPrimary,),
      label: 'Home',
    ),
     BottomNavigationBarItem(
        icon: Image.asset('assets/images/doctor.png',width: 25,height: 25,),
        activeIcon: Image.asset('assets/images/doctor.png',width: 25,height: 25,color: colorPrimary,),
        label: 'My Doctors'),
     BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/images/operation.svg',width: 25,height: 25,),
        activeIcon: SvgPicture.asset('assets/images/operation.svg',width: 25,height: 25,color: colorPrimary,),
        label: 'My Operations'),
     BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_outlined),
        activeIcon:Icon(Icons.more_horiz_outlined,color: colorPrimary,) ,
        label: 'More'),
  ];
  List <Widget> screens=
  [
    HomeScreenView(),
    MyDoctorsScreenView(),
    MyOperationScreenView(),
    MoreScreenView()
  ];
  Widget get getCurrenView => screens[currentIndex];
}
