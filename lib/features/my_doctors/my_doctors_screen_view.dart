import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/my_doctors/my_doctor_screen_cubit.dart';
import 'package:banhawy/features/my_doctors/my_doctor_screen_state.dart';
import 'package:banhawy/features/profile_doctor_screen/profile_doctor_screen.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyDoctorsScreenView extends StatelessWidget {
  const MyDoctorsScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>MyDoctorCubit()..fetchDoctors(),
    child: BlocBuilder<MyDoctorCubit,MyDoctorState>(
      builder: (context,state){
        var cubit=BlocProvider.of<MyDoctorCubit>(context).homeDoctors;
        if(state is FetchDoctorLoadingState){
          return Center(child: Image.asset('assets/images/Loading.gif'));
        }
        return Column(
          children: [
            const CustomContainer(text1: 'My Doctors ', text2: ''),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: colorGrey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            cubit!.data![0].profile!,
                        ),
                      ),
                      title:  CustomText(
                        text: cubit.data![0].name!,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      trailing: CustomButton(
                        widthButton: MediaQuery.of(context).size.width * .25,
                        heightButton: MediaQuery.of(context).size.height * .04,
                        text: 'Chat',
                        raduis: 10,
                        fontSize: 14,
                        fontColor: colorPrimary,
                        bgColor: Colors.white,
                        isIcon: true,
                        icon: Icon(
                          Icons.message,
                          color: colorPrimary,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 2,
                      ),
                      leading: CustomText(
                        text: 'Last operation :',
                        fontSize: 16,
                        color: Colors.red,
                      ),
                      title: CustomText(
                        text: cubit.data![0].operationName!,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 30,
                          color: colorBlack,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        CustomText(
                          text: cubit.data![0].operationDate!,
                          fontSize: 16,
                        ),
                        Spacer(),
                        CustomButton(
                          heightButton: MediaQuery.of(context).size.height * .04,
                          text: 'View Profile',
                          onPress: ()=>MagicRouter.navigateTo(ProfileDoctorScreen()),
                          fontSize: 15,
                          isIcon: true,
                          icon: Icon(
                            Icons.person,
                            color: colorPrimary,
                            size: 24,
                          ),
                          fontColor: colorPrimary,
                          widthButton: MediaQuery.of(context).size.width * .3,
                          bgColor: Colors.white,
                          raduis: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/Address.svg',
                          width: 28,
                          //height: 25,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        CustomText(
                          text: cubit.data![0].operationOperationCenter!,
                          fontSize: 16,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    ),);
  }
}
