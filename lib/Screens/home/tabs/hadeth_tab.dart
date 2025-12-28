import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadeth_model.dart';

import '../../hedeth_details/hedeth_details.dart';

class HadethTab extends StatefulWidget {
   HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
List<HadethModel> allAhadethData=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHadehtFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/Hadeth _Background.png"),
              fit: BoxFit.fill),

      ),//Hadith_Card .png
        child: CarouselSlider(
          options: CarouselOptions(height: double.infinity),
          items: allAhadethData.map((model) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.only(top:150 ),

                    child: Stack(
                      alignment:Alignment.topCenter ,
                      children: [
                        Image.asset("assets/images/Hadith_Card.png"),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Column(
                            children: [
                              Text(
                                model.title,
                                style:
                                TextStyle(
                                fontSize: 24,
                                  fontWeight: FontWeight.bold,

                              ),),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 24),
                                  child: ListView.builder(
                                    itemCount: model.content.length,
                                    itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){

                                        Navigator.pushNamed(context,HedethDetails.routeName
                                            ,arguments:  model,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),

                                        child: Text(
                                            model.content[index],
                                            maxLines: 7,
                                            textAlign: TextAlign.center,

                                            style:
                                        TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,

                                        )
                                        ),
                                      ),
                                    );
                                  },),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ));
              },
            );
          }).toList(),
        )
    );

  }

  LoadHadehtFile()async{

    String hadehtFile= await  rootBundle.loadString("assets/files/Hadeth.txt");
    List<String> allAhadeth=hadehtFile.split("#");
    for(int i=0;i<allAhadeth.length;i++) {
      String headethOne = allAhadeth[i];
      List<String> headethLines = headethOne.trim().split("\n");
      String titel = headethLines[0];
      headethLines.removeAt(0);
      List<String> headethContent = headethLines;
      allAhadethData.add(HadethModel(titel,headethContent));
    }
    setState(() {
    });
  }
}
