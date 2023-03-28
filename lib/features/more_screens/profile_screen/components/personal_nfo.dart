import 'package:banhawy/common_component/custom_button.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/common_component/custom_text_field.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_cubit.dart';
import 'package:banhawy/features/more_screens/profile_screen/profile_screen_state.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenCubit, ProfileScreenState>(
        builder: (context, state) {
      var cubit = BlocProvider.of<ProfileScreenCubit>(context);
      var cubitCities = BlocProvider.of<ProfileScreenCubit>(context).cityModel;
      if (state is UpdateProfileScreenLoadingState) {
        return Center(
          child: Image.asset('assets/images/Loading.gif'),
        );
      }
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          CustomTextField(
            upperText: 'code in clinc',
            // hint: cubitPatientModel!.data!.code!,
            fillColor: Colors.white,
            controller: cubit.codeController
          ),
          CustomTextField(
              lableText: 'Name',
              hasLabel: true,
              //  hint: cubitPatientModel.data!.name!,
              fillColor: Colors.white,
              controller: cubit.nameController ),
          CustomTextField(
            upperText: 'Email',
            // hint: cubitPatientModel.data!.email!,
            controller: cubit.emailController,
            fillColor: Colors.white,
            suffixIcon: Icon(
              Icons.edit,
              color: colorPrimary,
            ),
          ),
          CustomTextField(
            upperText: 'Phone Number',
            // hint: cubitPatientModel.data!.phone,
            controller: cubit.phoneController,
            fillColor: Colors.white,
          ),
          CustomTextField(
              // controller: cubit.addressController,
              upperText: 'Address',
              controller: cubit.addressController,
              // hint: cubit.addressController.text,
              fillColor: Colors.white,
              onTap: state is FetchCityLoadingState
                  ? () => Container(
                      color: Colors.white,
                      child: Image.asset('assets/images/Loading.gif'))
                  : () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          isDismissible: false,
                          builder: (context) => ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () => cubit.changeAddress(index),
                                  child: CustomText(
                                      text: cubitCities.data![index].title!)),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 15,
                                  ),
                              itemCount: cubitCities!.data!.length));
                    }),
          CustomTextField(
              upperText: 'gender',
              // hint: cubit.genderController.text,
              controller:cubit.genderController ,
              fillColor: Colors.white,
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                          height: 100,
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              itemBuilder: (context, index) => InkWell(
                                  onTap: () => cubit.changeGender(index),
                                  child: CustomText(text: cubit.gender[index])),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 15,
                                  ),
                              itemCount: cubit.gender.length),
                        ));
              }),
          CustomTextField(
            controller: cubit.dateController,
            upperText: 'Date',
            fillColor: Colors.white,
            onTap: () => cubit.selectDate(context),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomButton(
              text: 'Save',
              raduis: 15,
              onPress: () => cubit.updateProfileData(),
            ),
          )
        ],
      );
    });
  }
}
