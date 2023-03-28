import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/profile_doctor_screen/profile_doctor_screen_cubit.dart';
import 'package:banhawy/features/profile_doctor_screen/profile_doctor_screen_state.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDoctorScreen extends StatelessWidget {
  const ProfileDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocProvider(create: (context)=>ProfileDoctorScreenCubit()..fetchProfileData(),
   child: BlocBuilder<ProfileDoctorScreenCubit,ProfileDoctorScreenState>(
     builder:(context,state){
       var cubit=BlocProvider.of<ProfileDoctorScreenCubit>(context).doctorsModel;
       if(state is FetchProfileLoadingDoctorState){
         return Scaffold(
           backgroundColor: Colors.white,
           body:  Center(child: Image.asset('assets/images/Loading.gif')),
         );
       }
       return Scaffold(
         body: Column(
           children: [
             CustomContainer(text1: 'Doctor Profile', text2: ''),
             Padding(
               padding: const EdgeInsets.all(13.0),
               child: Container(
                 height: MediaQuery.of(context).size.height * .2,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15),
                   color: Colors.blueGrey,
                 ),
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       CircleAvatar(
                         radius: 25,
                         backgroundImage: NetworkImage(
                             cubit!.data!.profile!,
                         ),
                       ),
                       //Image.network(cubit!.data!.profile!),
                       SizedBox(height: 10,),
                       CustomText(
                         text: cubit.data!.name! ,
                         fontWeight: FontWeight.bold,
                         color: colorWhite,
                       ),
                     ],
                   ),
                 ),
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   CustomButton(
                     heightButton: MediaQuery.of(context).size.height * .04,
                     text: 'operations',
                     isIcon: true,
                     icon: Icon(
                       Icons.menu_open,
                       color: colorPrimary,
                     ),
                     fontSize: 14,
                     fontColor: colorPrimary,
                     widthButton: MediaQuery.of(context).size.width * .3,
                     bgColor: Colors.white,
                     raduis: 10,
                   ),
                   SizedBox(
                     width: 30,
                   ),
                   CustomButton(
                     heightButton: MediaQuery.of(context).size.height * .04,
                     text: 'chat',
                     onPress: ()=>MagicRouter.navigateTo(ProfileDoctorScreen()),
                     fontSize: 14,
                     isIcon: true,
                     icon: Icon(
                       Icons.message_outlined,
                       color: colorPrimary,
                       size: 25,
                     ),
                     fontColor: colorPrimary,
                     widthButton: MediaQuery.of(context).size.width * .3,
                     bgColor: Colors.white,
                     raduis: 10,
                   ),
                 ],
               ),
             ),
             SizedBox(
               height: 30,
             ),
             ListTile(
               leading: SvgPicture.asset('assets/images/Specialization.svg'),
               title: CustomText(
                 text: cubit.data!.specialization!,
               ),
               subtitle: CustomText(
                 text: 'Surgery',
                 color: colorGrey,
                 fontSize: 14,
               ),
             ),
             ListTile(
               leading: SvgPicture.asset('assets/images/Bio.svg'),
               title: CustomText(
                 text: cubit.data!.biography!,
               ),
               subtitle: CustomText(
                 text: 'qui',
                 color: colorGrey,
                 fontSize: 14,
               ),
             )
           ],
         ),
       );
     },
   ),);
  }
}
