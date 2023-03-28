import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/features/operation_details_screen/components/custom_prescription.dart';
import 'package:banhawy/features/operation_details_screen/operaition_details_screen_cubit.dart';
import 'package:banhawy/features/operation_details_screen/operation_details_screen_state.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsDetailsScreenCubit,
        OperationsDetailsScreenState>(
      builder: (context, state) {
        var prescriptionsList =
            BlocProvider.of<OperationsDetailsScreenCubit>(context)
                .operationDetailsModel!
                .prescriptions;
       // var cubit = BlocProvider.of<OperationsDetailsScreenCubit>(context);
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            Row(
              children: [
                Icon(
                  Icons.notes_sharp,
                  color: colorPrimary,
                ),
                const SizedBox(
                  width: 5,
                ),
                CustomText(
                  text: 'Doctor\'s notes',
                  fontSize: 16,
                  color: colorGrey,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            CustomText(
              text: BlocProvider.of<OperationsDetailsScreenCubit>(context)
                  .operationDetailsModel!
                  .notes!,
              alignment: Alignment.bottomRight,
              fontSize: 14,
            ),
            Divider(
              color: colorPrimary,
            ),
            ListView.separated(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => CustomPrescription(
                      medicamentName: prescriptionsList[index].drug!.name!,
                      compoundName: prescriptionsList[index].dosage!,
                      dosageName: prescriptionsList[index].duration!,
                    ),
                separatorBuilder: (context, index) => Divider(
                      color: colorPrimary,
                    ),
                itemCount: prescriptionsList!.length),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomButton(
                text: 'Print Prescription',
                bgColor: colorWhite,
                isIcon: true,
                icon: Icon(
                  Icons.print,
                  color: colorPrimary,
                ),
                fontColor: colorPrimary,
                raduis: 10,
              ),
            )
          ],
        );
      },
    );
  }
}
