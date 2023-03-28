import 'package:banhawy/common_component/custom_tab_bar.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/core/app_storage/app_storage.dart';
import 'package:banhawy/features/more_screens/profile_screen/components/change_password.dart';
import 'package:banhawy/features/more_screens/profile_screen/components/personal_nfo.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_cubit.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_state.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ProfileScreenCubit()..fetchCities(),
    child: BlocBuilder<ProfileScreenCubit,ProfileScreenState>(
      builder: (context,state){
         if(state is FetchCityLoadingState){
           return Scaffold(
             backgroundColor: Colors.white,
             body: Center(
               child: Image.asset('assets/images/Loading.gif'),
             ),
           );
         }else{
           return Scaffold(
             appBar: AppBar(
               title:  CustomText(text: 'Profile',color: colorWhite,),
               backgroundColor: colorPrimary,
               elevation: 0,
             ),
             body: DefaultTabController(
               length: 2,
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                       leading: CircleAvatar(
                         backgroundImage: NetworkImage(AppStorage.getUserInfo!.data!.profile!),
                         radius: 30,
                       ),
                       title:  CustomText(
                         text: AppStorage.getUserInfo!.data!.name!,
                         fontWeight: FontWeight.bold,
                       ),
                       subtitle:  CustomText(
                         text: AppStorage.getUserInfo!.data!.email!,
                         fontSize: 14,
                       ),
                     ),
                   ),
                   const Expanded(child: CustomTabBar(tabs: [
                     Tab(
                       text: 'Personal info',
                     ),
                     Tab(
                       text: 'Change Password',
                     )
                   ], isScrollable: false, pages:
                   [
                     PersonalInfo(),
                     ChangePassword()
                   ],))
                 ],
               ),
             ),
           );

         }
      },
    ),);
  }
}
