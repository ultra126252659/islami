import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/app_Style.dart';
import 'package:islami_app/core/app_colors.dart';

import 'Screens/home/HomeScreen.dart';
import 'core/cache_helper.dart';

class Introductionscreens extends StatelessWidget {
  static const String routeName="Introductionscreen";
   Introductionscreens({super.key});

late var listPagesViewModel=[
  PageViewModel(
    titleWidget: Text("Welcome To Islmi App",style: AppStyles.titleStyle ,),
    body: "",


    image: Image.asset("assets/images/intro1@3x.png"),
  ),
  PageViewModel(
    titleWidget: Text("Welcome To Islmi App",style: AppStyles.titleStyle ,),
    bodyWidget: Text("We Are Very Excited To Have You In Our Community",style: AppStyles.bodyStyle,
textAlign: TextAlign.center,
    ),

    image:  Image.asset("assets/images/intro2@3x.png"),
  ),
  PageViewModel(
    titleWidget: Text("Reading the Quran",style: AppStyles.titleStyle ,),
    bodyWidget: Text("Read, and your Lord is the Most Generous",style: AppStyles.bodyStyle,textAlign: TextAlign.center,),

    image:   Image.asset("assets/images/intro 3@3x.png"),
  ),
  PageViewModel(
    titleWidget: Text("Bearish",style: AppStyles.titleStyle ,),
bodyWidget: Text("Praise the name of your Lord, the Most High",
  style: AppStyles.bodyStyle,
  textAlign: TextAlign.center,
),

    image:   Image.asset("assets/images/intro4@3x.png"),
  ),
  PageViewModel(
    titleWidget: Text("Holy Quran Radio",style: AppStyles.titleStyle ,),
    bodyWidget: Text("You can listen to the Holy Quran Radio through the application for free and easily",
    style: AppStyles.bodyStyle,
      textAlign: TextAlign.center,

    ),

    image:   Image.asset("assets/images/intro5@3x.png"),
  ),


];
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Color(0xFF202020) ,

      pages: listPagesViewModel,
      showNextButton: false,
      bodyPadding: EdgeInsets.only(top:228 ),
      globalHeader: Image.asset("assets/images/Islami_top.png"),
      done:  Text("Done",style: AppStyles.bodyStyle,),


dotsDecorator:DotsDecorator(color:
AppColors.primary ,
  activeColor: Color(0xFF707070),
  activeSize: Size(20, 10),
  activeShape: OutlineInputBorder(borderRadius:BorderRadius.circular(8),
),
),
      showBackButton: true,
     back: Icon(Icons.arrow_back),
     showSkipButton: true,
      skip: Text("skip"),
      onSkip: ()async{
        await CacheHelper.saveBool(true);
        Navigator.pushNamed(context, HomeScreen.routeName);

      },
      onDone: () async{
        await CacheHelper.saveBool(true);
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
    );
  }
}
