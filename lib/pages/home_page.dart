import 'package:flutter/material.dart';
import 'package:hotel_ui/pages/hotel_ui.dart';

import 'hotel_ui2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                shape: StadiumBorder(),
                minWidth: 250,
                child: Text(
                  "Hotels UI",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(HotelsUI.id);
                }),
            SizedBox(height: 30,),
            MaterialButton(
                shape: StadiumBorder(),
                minWidth: 250,
                child: Text(
                  "Hotels UI2",
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(HotelsUI2.id);
                }),
          ],
        ),
      ),
    );
  }
}
