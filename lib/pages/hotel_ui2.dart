import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'hotel_ui.dart';

class HotelsUI2 extends StatefulWidget {
  const HotelsUI2({Key? key}) : super(key: key);

  static const String id = "hotels_ui2";

  @override
  _HotelsUI2State createState() => _HotelsUI2State();
}

class _HotelsUI2State extends State<HotelsUI2> {
  Future<void> _refresh() async {
    return Future.delayed(Duration(seconds: 3));
  }

  static const colorizeColors = [
    Colors.white,
    Colors.white,
    Colors.cyanAccent,
    Colors.cyanAccent,
    Colors.white,
    Colors.white,
  ];
  static const colorizeColor = [
    Colors.white,
    Colors.white,
    Colors.indigoAccent,
    Colors.indigoAccent,
    Colors.white,
    Colors.white,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 30,
    fontFamily: 'Horizon',
  );
  int indexImage = 0;

  List images = [
    "assets/images/ic_header.jpg",
    "assets/images/ic_hotel7.jpg",
    "assets/images/ic_hotel8.jpg",
    "assets/images/ic_hotel9.jpg",
    "assets/images/ic_hotel10.jpg",
  ];

  void changeIndex() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      indexImage = indexImage % 4 + 1;
      setState(() {});
    }
  }

  int time = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        time = 0;
      });
    });
    changeIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              edgeOffset: 20,
              displacement: 100,
              strokeWidth: 3,
              backgroundColor: Colors.white,
              color: Colors.black87,
              onRefresh: _refresh,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(images[indexImage]),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black87.withOpacity(.8),
                            Colors.black87.withOpacity(.4),
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            child: AnimatedTextKit(
                              repeatForever: true,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'Best Hotels Ever',
                                  textStyle: colorizeTextStyle,
                                  textAlign: TextAlign.center,
                                  colors: colorizeColor,
                                ),
                                ColorizeAnimatedText(
                                  'Best Hotels Ever',
                                  textStyle: colorizeTextStyle,
                                  textAlign: TextAlign.center,
                                  colors: colorizeColors,
                                ),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                isCollapsed: true,
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintText: "Search for hotels...",
                                hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, HotelsUI.id,);
                          },
                          child: Text(
                            "Business Hotels",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: time == 1
                              ? Shimmer.fromColors(
                            highlightColor: Colors.grey.shade400,
                            baseColor: Colors.grey.shade200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                makeItem(
                                    image: 'assets/images/ic_hotel3.jpg',
                                    title: 'Hotel 1'),
                                makeItem(
                                    image: 'assets/images/ic_hotel1.jpg',
                                    title: 'Hotel 2'),
                                makeItem(
                                    image: 'assets/images/ic_hotel2.jpg',
                                    title: 'Hotel 3'),
                                makeItem(
                                    image: 'assets/images/ic_hotel4.jpg',
                                    title: 'Hotel 4'),
                                makeItem(
                                    image: 'assets/images/ic_hotel0.jpg',
                                    title: 'Hotel 5')
                              ],
                            ),
                          )
                              : ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeItem(
                                  image: 'assets/images/ic_hotel3.jpg',
                                  title: 'Hotel 1'),
                              makeItem(
                                  image: 'assets/images/ic_hotel2.jpg',
                                  title: 'Hotel 2'),
                              makeItem(
                                  image: 'assets/images/ic_hotel1.jpg',
                                  title: 'Hotel 3'),
                              makeItem(
                                  image: 'assets/images/ic_hotel4.jpg',
                                  title: 'Hotel 4'),
                              makeItem(
                                  image: 'assets/images/ic_hotel0.jpg',
                                  title: 'Hotel 5')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Airport Hotels",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: time == 1
                              ? Shimmer.fromColors(
                            highlightColor: Colors.grey.shade400,
                            baseColor: Colors.grey.shade200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                makeItem(
                                    image: 'assets/images/ic_hotel0.jpg',
                                    title: 'Hotel 1'),
                                makeItem(
                                    image: 'assets/images/ic_hotel1.jpg',
                                    title: 'Hotel 2'),
                                makeItem(
                                    image: 'assets/images/ic_hotel2.jpg',
                                    title: 'Hotel 3'),
                                makeItem(
                                    image: 'assets/images/ic_hotel3.jpg',
                                    title: 'Hotel 4'),
                                makeItem(
                                    image: 'assets/images/ic_hotel4.jpg',
                                    title: 'Hotel 5')
                              ],
                            ),
                          )
                              : ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeItem(
                                  image: 'assets/images/ic_hotel0.jpg',
                                  title: 'Hotel 1'),
                              makeItem(
                                  image: 'assets/images/ic_hotel1.jpg',
                                  title: 'Hotel 2'),
                              makeItem(
                                  image: 'assets/images/ic_hotel2.jpg',
                                  title: 'Hotel 3'),
                              makeItem(
                                  image: 'assets/images/ic_hotel3.jpg',
                                  title: 'Hotel 4'),
                              makeItem(
                                  image: 'assets/images/ic_hotel4.jpg',
                                  title: 'Hotel 5')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Resort hotel",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          child: time == 1
                              ? Shimmer.fromColors(
                            highlightColor: Colors.grey.shade400,
                            baseColor: Colors.grey.shade200,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                makeItem(
                                    image: 'assets/images/ic_hotel4.jpg',
                                    title: 'Hotel 1'),
                                makeItem(
                                    image: 'assets/images/ic_hotel3.jpg',
                                    title: 'Hotel 2'),
                                makeItem(
                                    image: 'assets/images/ic_hotel2.jpg',
                                    title: 'Hotel 3'),
                                makeItem(
                                    image: 'assets/images/ic_hotel1.jpg',
                                    title: 'Hotel 4'),
                                makeItem(
                                    image: 'assets/images/ic_hotel0.jpg',
                                    title: 'Hotel 5')
                              ],
                            ),
                          )
                              : ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeItem(
                                  image: 'assets/images/ic_hotel4.jpg',
                                  title: 'Hotel 1'),
                              makeItem(
                                  image: 'assets/images/ic_hotel3.jpg',
                                  title: 'Hotel 2'),
                              makeItem(
                                  image: 'assets/images/ic_hotel2.jpg',
                                  title: 'Hotel 3'),
                              makeItem(
                                  image: 'assets/images/ic_hotel1.jpg',
                                  title: 'Hotel 4'),
                              makeItem(
                                  image: 'assets/images/ic_hotel0.jpg',
                                  title: 'Hotel 5')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black87.withOpacity(.8),
                Colors.black87.withOpacity(.2),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
             Icon(
               Icons.favorite,
               color: Colors.red,
             )
            ],
          ),
        ),
      ),
    );
  }
}
