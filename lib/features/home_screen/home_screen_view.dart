import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/core/app_storage/app_storage.dart';
import 'package:banhawy/core/dio_helper/dio_helper.dart';
import 'package:banhawy/features/home_screen/home_screen_cubit.dart';
import 'package:banhawy/features/home_screen/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>HomeScreenCubit()..fetchHomeData(),
    child: BlocBuilder<HomeScreenCubit,HomeScreenState>(
      builder: (context,state){
        var cubit=BlocProvider.of<HomeScreenCubit>(context).patientHomeModel;
        if(state is HomeLoadingSate){
          return Center(child: Image.asset('assets/images/Loading.gif'));
        }
        return Column(
          children: [
             CustomContainer(
              text1: 'Welcome , ',
              text2: '${AppStorage.getUserInfo!.data!.name!} !',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            Container(
                height: MediaQuery.of(context).size.width * .3,
                width: MediaQuery.of(context).size.width * .39,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/lo.jpeg',
                        ),
                        fit: BoxFit.fill))),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                  text: cubit!.privacy!
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/Address.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       CustomText(
                        text: cubit.address![0],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/Address.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       CustomText(
                        text: cubit.address![1],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/Address.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       CustomText(
                        text: cubit.address![2],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .02,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/Phone.svg',
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .02,
                      ),
                       CustomText(
                        text: cubit.phone![0],
                        fontSize: 18,
                      ),
                       CustomText(
                        text: cubit.phone![1],
                        fontSize: 18,
                      ),
                       CustomText(
                         text: cubit.phone![2],
                        fontSize: 18,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){  DioHelper.launchURL(cubit.socialMedia!.facebook);},
                        child: Image.asset(
                          'assets/images/facebook.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: (){
                          DioHelper.launchURL(cubit.socialMedia!.instagram);
                        },
                        child: Image.asset(
                          'assets/images/inst.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: (){  DioHelper.launchURL(cubit.socialMedia!.whatsapp);},
                        child: Image.asset(
                          'assets/images/whats.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: (){
                                DioHelper.launchURL(cubit.socialMedia!.youtube);
                        },
                        child: Image.asset(
                          'assets/images/youtube.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      },
    ),);
  }
}
