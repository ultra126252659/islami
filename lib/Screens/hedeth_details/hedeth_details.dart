import 'package:flutter/material.dart';

import '../../core/app_Style.dart';
import '../../core/app_colors.dart';
import '../../models/hadeth_model.dart';

class HedethDetails extends StatelessWidget {
  static const String routeName = "HedethDetails";
  const HedethDetails({super.key});


  @override
  Widget build(BuildContext context) {
    var model= ModalRoute.of(context)?.settings.arguments as HadethModel;
    return   Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        iconTheme:IconThemeData(
          color: AppColors.primary,
        ) ,
        title: Text(model.title,style:AppStyles.bodyStyle,
        ) ,
        centerTitle: true,

      ),
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("assets/images/Soura_Details_Screen.png",fit: BoxFit.cover,),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35 ),
                  child: Text(model.title,style: AppStyles.bodyStyle,),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(

                  child: ListView.builder(
                    itemCount: model.content.length,
                    itemBuilder: (context, index) =>
                        Center(child:
                        Text(
                          model.content[index],
                          style: AppStyles.bodyStyle,
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
