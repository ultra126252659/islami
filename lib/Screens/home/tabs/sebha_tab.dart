import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
SebhaTab({super.key});


@override
State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  double angle = 0;
  int counter = 0;
  int zekrIndex = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];
@override
Widget build(BuildContext context) {
return Container(
decoration: BoxDecoration(
image: DecorationImage(image: AssetImage("assets/images/Sebha_Background.png"),fit: BoxFit.fill)

),

child:Column(

mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
SizedBox(height: 100,),
Image.asset("assets/images/Sebha_head.png"),
  InkWell(
    onTap: () {
      setState(() {
        angle += 0.1;

        counter++;

        if (counter >= 34) {
          counter = 0;
          zekrIndex = (zekrIndex + 1) % azkar.length;
        }
      });


      },
  child: Stack(
    alignment: Alignment.center,
  children: [

  Transform.rotate(
      angle: angle ,
    child: Image.asset(
      "assets/images/SebhaBody.png",
    ),

  ),

   Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [




    Text(
      azkar[zekrIndex],
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),

    ),

       Text(
         "${counter}",
         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),

       ),




    SizedBox(height: 10),
    Text(
      counter.toString(),
      style: TextStyle(fontSize: 22),
    ),

      ],
   ),



  ],

  ),
)

],

)
);
}
}