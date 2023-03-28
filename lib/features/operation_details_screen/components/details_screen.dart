import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/features/operation_details_screen/operaition_details_screen_cubit.dart';
import 'package:banhawy/features/operation_details_screen/operation_details_screen_state.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsDetailsScreenCubit,
        OperationsDetailsScreenState>(builder: (context,state){
      var cubit=BlocProvider.of<OperationsDetailsScreenCubit>(context).operationDetailsModel;
      return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Septoplasty and Turbinate Reduction',
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/images/Frame.svg'),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.01,
                ),
                const CustomText(
                  text: 'Doctor Name : ',
                  color: Colors.red,
                  fontSize: 16,
                ), CustomText(
                  text: cubit!.doctorName!,
                  fontSize: 16,
                )
              ],
            ) ,
            SizedBox(
              height: MediaQuery.of(context).size.height*.015,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.phone,color: colorPrimary,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.01,
                ),
                const CustomText(
                  text: 'Doctor Number : ',
                  color: Colors.red,
                  fontSize: 16,
                ),
                CustomText(
                  text: cubit.doctorPhone!,
                  fontSize: 16,
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            const Divider(),
            Row(
              children: [
                Icon(Icons.date_range,color: colorPrimary,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.02,
                ),
                 CustomText(text: cubit.operationDate!,fontSize: 20,),
                const Spacer(),
                SvgPicture.asset('assets/images/Location.svg'),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.02,
                ),
                 CustomText(text: cubit.operationCenter!,fontSize: 20,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Icon(Icons.notes_sharp,color: colorPrimary,),
                const SizedBox(width: 5,),
                CustomText(
                  text: cubit.notes!,
                  fontSize: 16,
                  color: colorGrey,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            const CustomText(
              text: 'لا يوجد ملاحظات',
              alignment: Alignment.bottomRight,
              fontSize: 14,
            ),
          ],
        ),
      );
    });
  }
}
