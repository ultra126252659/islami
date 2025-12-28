import 'package:flutter/material.dart';
import 'package:islami_app/Screens/home/HomeScreen.dart';
import 'package:islami_app/introduction_screen.dart';

import 'Screens/hedeth_details/hedeth_details.dart';
import 'Screens/sura_details/sura_details_screen.dart';
import 'core/cache_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

      initialRoute: CacheHelper.getBool("introduction")==true
          ? HomeScreen.routeName
      :Introductionscreens.routeName ,
      routes: {
        Introductionscreens.routeName :(context)=>Introductionscreens(),
        HomeScreen.routeName:(context)=> HomeScreen(),
        SuraDetailsScreen.routeName:(context)=> SuraDetailsScreen(),
        HedethDetails.routeName:(context)=>HedethDetails(),
      },
    );
  }
}



