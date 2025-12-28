import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Screens/home/tabs/hadeth_tab.dart';
import 'package:islami_app/Screens/home/tabs/quran_tab.dart';
import 'package:islami_app/Screens/home/tabs/radio_tab.dart';
import 'package:islami_app/Screens/home/tabs/sebha_tab.dart';
import 'package:islami_app/Screens/home/tabs/time_tab.dart';
import 'package:islami_app/core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="Home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedTab=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        backgroundColor:AppColors.primary ,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
       unselectedItemColor: Colors.black,
        currentIndex: selectedTab,
          onTap:(value) {
selectedTab=value;
setState(() {});
          } ,
          items: [
        BottomNavigationBarItem(
            backgroundColor:AppColors.primary ,
            icon:getBottomnavBarItem("Soura_icon",0),
    label:"Quran"  ),
        BottomNavigationBarItem(
            backgroundColor:AppColors.primary ,
            icon: getBottomnavBarItem("Hadeth_ic",2),
            label:"Hadeth"  ),
        BottomNavigationBarItem(
            backgroundColor:AppColors.primary ,
            icon: getBottomnavBarItem("sebha_icon",3),
            label:"Sebha"
        ),
        BottomNavigationBarItem(
            backgroundColor:AppColors.primary ,
            icon: getBottomnavBarItem("radio-icon",3)
            ,label:"Radio"
        ),
        BottomNavigationBarItem(
            backgroundColor:AppColors.primary ,
           icon: getBottomnavBarItem("time_icon",4),
            label:"Time"
        ),



      ]),
      body:Stack(
        alignment: Alignment.topCenter,
      children: [
      tabs [selectedTab],
     Image.asset("assets/images/Islami_top.png"),
],
      ),
    );

  }
  List<Widget> tabs=[
  QuranTab(),
   HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),

  ];

 Widget getBottomnavBarItem(String image ,int index){
    return selectedTab==index? Container(
      padding: EdgeInsets.symmetric(horizontal:12,vertical: 2 ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(24),

      ),
      child:ImageIcon(AssetImage("assets/images/$image.png")),
    )
      :ImageIcon(AssetImage("assets/images/$image.png"));


 }
}
