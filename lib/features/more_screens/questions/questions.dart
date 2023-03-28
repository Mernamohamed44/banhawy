import 'package:banhawy/common_component/custom_container.dart';
import 'package:banhawy/common_component/custom_text.dart';
import 'package:banhawy/public/style.dart';
import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
          const CustomContainer(text1: 'FAQ Questions', text2: ''),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: ListTileTheme(
              tileColor: colorGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
              child: ExpansionTile(
                expandedAlignment: Alignment.topLeft,
                trailing: Icon(Icons.arrow_drop_down,color: colorWhite,),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
                title: CustomText(
                  color: colorWhite,
                  text: 'عمليه استعدال الحاجز الانفي وتصغير الغضاريف الانفيه',
                  fontSize: 14,
                ),
                children:[
                  CustomText(
                    verticalMargin: 10,
                    color: colorBlack,
                    text: 'ما هي الاثار الجانبيه المتوقعه؟ ',
                    fontSize: 14,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
