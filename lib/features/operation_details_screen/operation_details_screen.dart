import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_tab_bar.dart';
import 'package:banhawy/features/my_operation/my_operation_state.dart';
import 'package:banhawy/features/operation_details_screen/components/details_screen.dart';
import 'package:banhawy/features/operation_details_screen/components/instrution_screen.dart';
import 'package:banhawy/features/operation_details_screen/components/prescription_screen.dart';
import 'package:banhawy/features/operation_details_screen/operaition_details_screen_cubit.dart';
import 'package:banhawy/features/operation_details_screen/operation_details_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationDetailsScreen extends StatelessWidget {
  const OperationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>OperationsDetailsScreenCubit()..fetchOperation(),
       child: BlocBuilder<OperationsDetailsScreenCubit,
           OperationsDetailsScreenState>(
         builder: (context,state){
           if(state is FetchOperationDetailsLoadingState){
             return Scaffold(
               backgroundColor: Colors.white,
               body: Center(
                 child: Image.asset('assets/images/Loading.gif'),
               ),
             );
           }
           else{
             return Scaffold(
               body: DefaultTabController(
                 length: 3,
                 child: Column(
                   children: [
                     const CustomContainer(text1: 'Operation Details', text2: ''),
                     Padding(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 10,
                           vertical: 10
                       ),
                       child: Image.asset('assets/images/doctor-with-patient.png'),
                     ),
                     const Expanded(
                       child: CustomTabBar(
                           tabs: [
                             Tab(
                               text: 'Instruction',
                             ),Tab(
                               text: 'Prescription',
                             ),Tab(
                               text: 'Details',
                             )
                           ],
                           isScrollable:false,
                           pages:[
                             Instruction(),
                             PrescriptionScreen(),
                             DetailsScreen()

                           ]),
                     )
                   ],
                 ),
               ),
             );
           }
         },
       ),
    );
  }
}
