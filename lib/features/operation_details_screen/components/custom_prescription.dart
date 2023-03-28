import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';

class CustomPrescription extends StatelessWidget {
  const CustomPrescription(
      {Key? key,
      required this.medicamentName,
      required this.compoundName,
      required this.dosageName})
      : super(key: key);
  final String medicamentName;
  final String compoundName;
  final String dosageName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Medicament Name',
          color: colorPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        CustomText(
          text: medicamentName,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .2,
        ),
        CustomText(
          text: 'Dosage',
          color: colorPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        CustomText(
          text: dosageName,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ],
    );
  }
}
