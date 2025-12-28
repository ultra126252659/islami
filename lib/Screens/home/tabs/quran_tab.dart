import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/app_Style.dart';
import 'package:islami_app/core/app_colors.dart';
import 'package:islami_app/core/cache_helper.dart';
import 'package:islami_app/models/sura_model.dart';

import '../../sura_details/sura_details_screen.dart';
import '../Wedigets/recently_item.dart';
import '../Wedigets/sura_item.dart';

class QuranTab extends StatefulWidget {

   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createSurahsList();
    filteredSuras=allSuras;
  }
  List<int> displayMostRecent=CacheHelper.getList("items");

  List<String> surahNames = [
    "الفاتحة", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس",
    "هود", "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
    "الأنبياء", "الحج", "المؤمنون", "النور", "الفرقان", "الشعراء", "النمل", "القصص", "العنكبوت", "الروم",
    "لقمان", "السجدة", "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر",
    "فصلت", "الشورى", "الزخرف", "الدخان", "الجاثية", "الأحقاف", "محمد", "الفتح", "الحجرات", "ق",
    "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة", "الحشر", "الممتحنة",
    "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج",
    "نوح", "الجن", "المزمل", "المدثر", "القيامة", "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس",
    "التكوير", "الانفطار", "المطففين", "الانشقاق", "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد",
    "الشمس", "الليل", "الضحى", "الشرح", "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات",
    "القارعة", "التكاثر", "العصر", "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر",
    "المسد", "الإخلاص", "الفلق", "الناس"
  ];

   List<String> surahNamesEn = [
     "Al-Fatihah", "Al-Baqarah", "Aal-E-Imran", "An-Nisa", "Al-Ma'idah",
     "Al-An'am", "Al-A'raf", "Al-Anfal", "At-Tawbah", "Yunus",
     "Hud", "Yusuf", "Ar-Ra'd", "Ibrahim", "Al-Hijr",
     "An-Nahl", "Al-Isra", "Al-Kahf", "Maryam", "Ta-Ha",
     "Al-Anbiya", "Al-Hajj", "Al-Mu'minun", "An-Nur", "Al-Furqan",
     "Ash-Shu'ara", "An-Naml", "Al-Qasas", "Al-Ankabut", "Ar-Rum",
     "Luqman", "As-Sajdah", "Al-Ahzab", "Saba", "Fatir",
     "Ya-Sin", "As-Saffat", "Sad", "Az-Zumar", "Ghafir",
     "Fussilat", "Ash-Shura", "Az-Zukhruf", "Ad-Dukhan", "Al-Jathiyah",
     "Al-Ahqaf", "Muhammad", "Al-Fath", "Al-Hujurat", "Qaf",
     "Adh-Dhariyat", "At-Tur", "An-Najm", "Al-Qamar", "Ar-Rahman",
     "Al-Waqi'ah", "Al-Hadid", "Al-Mujadila", "Al-Hashr", "Al-Mumtahanah",
     "As-Saff", "Al-Jumu'ah", "Al-Munafiqun", "At-Taghabun", "At-Talaq",
     "At-Tahrim", "Al-Mulk", "Al-Qalam", "Al-Haqqah", "Al-Ma'arij",
     "Nuh", "Al-Jinn", "Al-Muzzammil", "Al-Muddaththir", "Al-Qiyamah",
     "Al-Insan", "Al-Mursalat", "An-Naba", "An-Nazi'at", "Abasa",
     "At-Takwir", "Al-Infitar", "Al-Mutaffifin", "Al-Inshiqaq", "Al-Buruj",
     "At-Tariq", "Al-A'la", "Al-Ghashiyah", "Al-Fajr", "Al-Balad",
     "Ash-Shams", "Al-Layl", "Ad-Duha", "Ash-Sharh", "At-Tin",
     "Al-Alaq", "Al-Qadr", "Al-Bayyinah", "Az-Zalzalah", "Al-Adiyat",
     "Al-Qari'ah", "At-Takathur", "Al-Asr", "Al-Humazah", "Al-Fil",
     "Quraysh", "Al-Ma'un", "Al-Kawthar", "Al-Kafirun", "An-Nasr",
     "Al-Masad", "Al-Ikhlas", "Al-Falaq", "An-Nas"
   ];

   List<int> surahVersesCount = [
     7, 286, 200, 176, 120,
     165, 206, 75, 129, 109,
     123, 111, 43, 52, 99,
     128, 111, 110, 98, 135,
     112, 78, 118, 64, 77,
     227, 93, 88, 69, 60,
     34, 30, 73, 54, 45,
     83, 182, 88, 75, 85,
     54, 53, 89, 59, 37,
     35, 38, 29, 18, 45,
     60, 49, 62, 55, 78,
     96, 29, 22, 24, 13,
     14, 11, 11, 18, 12,
     12, 30, 52, 52, 44,
     28, 28, 20, 56, 40,
     31, 50, 40, 46, 42,
     29, 19, 36, 25, 22,
     17, 19, 26, 30, 20,
     15, 21, 11, 8, 8,
     19, 5, 8, 8, 11,
     11, 8, 3, 9, 5,
     4, 7, 3, 6, 3,
     5, 4, 5, 6
   ];

   List<SuraModel> allSuras=[];
  List<SuraModel> filteredSuras=[];

void createSurahsList(){

  for(int i=0;i<surahNames.length;i++){
    allSuras.add(SuraModel(
        versesCount:surahVersesCount[i],
    nameEN: surahNamesEn[i],
      nameAr: surahNames[i],
      suraIndex: i+1


    ),);
  }
//img_most_recent.png
}
TextEditingController searchController=TextEditingController();
void fillterSuras(String query){
if(query.isEmpty) {
  filteredSuras=allSuras;

}else{
  filteredSuras=allSuras.where((model) {
    return model.nameAr.contains(query)||model.nameEN.toLowerCase().contains(query.toLowerCase());
  },).toList();
}

setState(() {});
 }
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
       image: DecorationImage(image: AssetImage("assets/images/quran_Background@3x.png")

       ,fit: BoxFit.fill)
     ),
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 192),
            TextField(
             controller: searchController,
              cursorColor: AppColors.primary,
               onChanged: (value){
                 fillterSuras(value);
               },
               style: TextStyle(
                 fontSize: 16,
                color:Colors.white ,
                fontWeight: FontWeight.bold,
               ) ,
              decoration: InputDecoration(
                prefixIcon: ImageIcon(AssetImage("assets/images/ic_quran@3x.png")
                ,color: AppColors.primary,
                ),
                hintStyle: TextStyle(
                  fontSize: 16,
                  color:Colors.white ,
                  fontWeight: FontWeight.bold,
                ) ,
               hintText: "sura Name",
                focusedBorder:OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primary
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),



              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primary
                ),
                borderRadius: BorderRadius.circular(16),
              )


              ),


            ),

            SizedBox(height: 20),
            if(displayMostRecent.isNotEmpty)...[
              Text("Most Recently ",style: TextStyle(
                fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold,

              ),),
              SizedBox(height: 10),

              SizedBox(
                height: 155,
                child: ListView.separated(
                  separatorBuilder: (context,index)=>
                      SizedBox(
                        width: 12,
                      ),
                  itemCount: displayMostRecent.length,

                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index) {
                    return RecentlyItem(

                      model:
                      SuraModel(
                          versesCount: surahVersesCount[displayMostRecent[index]],
                          nameEN: surahNamesEn[displayMostRecent[index]],
                          nameAr: surahNames[displayMostRecent[index]],
                          suraIndex: displayMostRecent[index]+1),
                    );

                  },),
              ),
              SizedBox(height: 10),
            ],

            Text("Suras List ",style: TextStyle(
              fontSize: 16,color:Colors.white,fontWeight: FontWeight.bold,

            ),),

            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) =>
               Divider(
                 color: Colors.white,
                 endIndent: 44,indent: 44,
               ) ,
                itemCount: filteredSuras.length,
                itemBuilder: (context,index){

                return InkWell(
                  onTap: () {
                    CacheHelper.saveList(index);
                    setState(() {});
                    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                     arguments: filteredSuras[index]



                    );
                  },
                  child: SuraItem(
                   model: filteredSuras[index],


                  ),
                );





              },


              ),
            ),

          ],


        ),
      ),
    );
  }
}
