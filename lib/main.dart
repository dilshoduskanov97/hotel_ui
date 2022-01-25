import 'package:flutter/material.dart';
import 'package:hotel_ui/pages/home_page.dart';
import 'package:hotel_ui/pages/hotel_ui.dart';
import 'package:hotel_ui/pages/hotel_ui2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        HotelsUI.id:(context)=>HotelsUI(),
        HotelsUI2.id:(context)=>HotelsUI2(),
      },

    );
  }
}