import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/features/home_screen/home_screen_cubit.dart';
import 'package:banhawy/features/home_screen/home_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>HomeScreenCubit()..fetchHomeData(),
      child: BlocBuilder<HomeScreenCubit,HomeScreenState>(
        builder: (context,state){
          var cubit=BlocProvider.of<HomeScreenCubit>(context).patientHomeModel;
           if(state is HomeLoadingSate){
             return Scaffold(
               backgroundColor: Colors.white,
               body: Center(
                 child: Image.asset('assets/images/Loading.gif'),
               ),
             );
           }
          return Scaffold(
            body: Column(
              children: [
                CustomContainer(text1: 'Privacy', text2: ''),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomText(
                    text: cubit!.privacy!,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
