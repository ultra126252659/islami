import 'package:flutter/material.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/models/sura_model.dart';

class RecentlyItem extends StatelessWidget {
  SuraModel model;
   RecentlyItem({super.key,required this .model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,

      padding:EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8
      ) ,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                model.nameEN,
               maxLines: 1
                ,style: TextStyle(
                color: Colors.black,
                fontWeight:FontWeight.bold,
                fontSize: 20,
              ),),
              SizedBox(
             height:8 ,

              ),

              Text(model.nameAr,style: TextStyle(
                color: Colors.black,
                fontWeight:FontWeight.bold,
                fontSize: 24,
              ),),
              SizedBox(
                height:8 ,

              ),
              Text("${model.versesCount} verses",style: TextStyle(
                color: Colors.black,
                fontWeight:FontWeight.bold,
                fontSize: 14,
              ),),
            ],
          ),Expanded(

              child: Image.asset("assets/images/img_most_recent.png"))

        ],

      ),

    );
  }
}
