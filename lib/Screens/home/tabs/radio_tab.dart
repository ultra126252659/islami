
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Screens/home/items/radio_items.dart';
import 'package:islami_app/core/app_Style.dart';
import 'package:islami_app/core/app_colors.dart';



class RadioTab extends StatefulWidget  {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RiduoTapState();
}

class _RiduoTapState extends State<RadioTab> with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController =TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
          image: DecorationImage(
              image: AssetImage("assets/images/radio_Background@3x.png"),
              fit: BoxFit.cover)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(height: 200,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Color(0xB2202020),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor:AppColors.primary ,
                  labelColor: AppColors.primary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.white,
                  controller:tabController ,
                  labelStyle: AppStyles.titleStyle,
                  tabs: [
                    Tab(child: Text("Radio")),
                    Tab(child: Text("Reciters")),
                  ]),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: TabBarView(
                  controller:tabController ,
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount:10,
                            itemBuilder: (context, index) {
                              return RadioItems(); },
                            separatorBuilder:(context, index)=>SizedBox(height: 10,),


                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount:10,
                            itemBuilder: (context, index) {
                              return RadioItems(); },
                            separatorBuilder:(context, index)=>SizedBox(height: 10,),


                          ),
                        )
                      ],
                    ),
                  ]),
            )
          ],
        ),
      ),

    );
  }
}





//"assets/images/radio_Background.png"