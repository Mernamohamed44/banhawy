import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/features/my_operation/components/youtube_video.dart';
import 'package:banhawy/features/operation_details_screen/operaition_details_screen_cubit.dart';
import 'package:banhawy/features/operation_details_screen/operation_details_screen_state.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Instruction extends StatelessWidget {
  const Instruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsDetailsScreenCubit,
        OperationsDetailsScreenState>(builder: (context, state) {
      var cubit = BlocProvider.of<OperationsDetailsScreenCubit>(context)
          .operationDetailsModel!
          .dailyInstruction;
      return ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: ListTileTheme(
                tileColor: colorGrey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ExpansionTile(
                  expandedAlignment: Alignment.topLeft,
                  trailing: Icon(
                    Icons.arrow_drop_down,
                    color: colorWhite,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: CustomText(
                    color: colorWhite,
                    text: cubit[index].day!,
                    fontSize: 14,
                  ),
                  children: [
                    Container(
                        child: Column(
                          children: [
                            Image.network(cubit[index].image!),
                            SizedBox(height: 15,),
                            YoutubeVideo(
                              videoLink: cubit[index].link!,
                            )
                          ],
                        ))
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 7,
          ),
          itemCount: cubit!.length);
    });
  }
}
