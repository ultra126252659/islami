import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_Style.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName="SuraDetailsScreen";
   SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
   List<String> verses=[];

  @override
  Widget build(BuildContext context) {
    var model=ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuraFile(model.suraIndex);
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
       iconTheme:IconThemeData(
         color: AppColors.primary,
       ) ,
       title: Text(model.nameEN,style:AppStyles.bodyStyle,
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
                child: Text(model.nameAr,style: AppStyles.bodyStyle,),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(

                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) =>
                      Center(child:
                      Text(verses[index],
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

  Future<void>  loadSuraFile(int index) async{
  String suraFile= await rootBundle.loadString("assets/files/$index.txt");
   List<String> suraLines = suraFile.split("\n");
   verses=suraLines;
setState(() {});
   print(verses);
  }
}
