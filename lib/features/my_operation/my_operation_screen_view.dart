import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/core/router/router.dart';
import 'package:banhawy/features/my_operation/my_operation_cubit.dart';
import 'package:banhawy/features/my_operation/my_operation_state.dart';
import 'package:banhawy/features/operation_details_screen/operation_details_screen.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyOperationScreenView extends StatelessWidget {
  const MyOperationScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOperationCubit()..fetchOperation(),
      child: BlocBuilder<MyOperationCubit,MyOperationState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<MyOperationCubit>(context).homeOperation;
          if(state is OperationLoadingState ){
            return Center(child: Image.asset('assets/images/Loading.gif'));
          }
          else {
            return Column(
              children: [
                const CustomContainer(text1: 'My Operations', text2: ''),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
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
                            horizontal: 1,
                          ),
                          leading: const CustomText(
                            text: 'Operation Name :',
                            color: Colors.red,
                            fontSize: 14,
                          ),
                          title: CustomText(
                            text: cubit!.data![0].operationName!,
                            fontSize: 16,
                          ),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 1,
                          ),
                          leading: const CustomText(
                            text: 'Doctor Name :',
                            fontSize: 16,
                            color: Colors.red,
                          ),
                          title: CustomText(
                            text: cubit.data![0].doctor!,
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
                            const Spacer(),
                            CustomButton(
                              onPress: () => MagicRouter.navigateTo(
                                  const OperationDetailsScreen()),
                              text: 'Show Details',
                              fontSize: 14,
                              fontColor: colorPrimary,
                              heightButton:
                              MediaQuery.of(context).size.height * .04,
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
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .02,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
