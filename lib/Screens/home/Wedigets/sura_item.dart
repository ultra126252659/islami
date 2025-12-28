import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_model.dart';

class  SuraItem extends StatelessWidget {
    SuraModel model;
    SuraItem({super.key,required this. model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:EdgeInsets.zero,
     trailing:Text(
       model.nameAr,
       style: TextStyle(color:Colors.white
           ,fontSize: 20
           ,fontWeight:FontWeight.bold ),),
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/img_sur_number_frame (1).png",width: 52,height: 52,),
          Text(
            "${model.suraIndex}", style: TextStyle(color:Colors.white
              ,fontSize: 20
              ,fontWeight:FontWeight.bold ),)
        ],
      ),
      subtitle:  Text(
        "${model.versesCount} verses",
        style: TextStyle(color:Colors.white
            ,fontSize: 14
            ,fontWeight:FontWeight.bold ),),
   title: Text(
     model.nameEN,
     style: TextStyle(color:Colors.white
         ,fontSize: 20
         ,fontWeight:FontWeight.bold ),),


    );
  }
}
