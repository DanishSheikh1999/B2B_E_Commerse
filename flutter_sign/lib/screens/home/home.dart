import "package:flutter/material.dart";
import 'dart:math';
import 'dart:async';

import 'package:flutter_sign/Custom_builds/flipcard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController pageController;
  // AnimationController animationController;
  // Animation<double> animation,back_animation;
  // AnimationStatus animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // animationController = AnimationController(vsync:this,duration:Duration(milliseconds: 500));

    // animation = TweenSequence(
    //   <TweenSequenceItem<double>>[
    //     TweenSequenceItem<double>(
    //       tween: Tween(begin: 0.0, end: 1.0)
    //           .chain(CurveTween(curve: Curves.easeIn)),
    //       weight: 50.0,
    //     ),
    //     TweenSequenceItem<double>(
    //       tween: ConstantTween<double>(1.0),
    //       weight: 50.0,
    //     ),
    //   ],
    // ).animate(animationController)
    // ..addListener(() {
    //   setState(() {

    //   });
    // })
    // ..addStatusListener((status) {
    //   animationStatus = status;
    // });
  }

  List<String> names = [
    "Electronics",
    "Raw Food",
    "FMCG",
    "Clothing",
    "Footwear",
    "Sports",
    "Furniture",
    "Home & Kitchen",
    "Toys",
    "Seasonal Goods"
  ];
  List<String> images = [
    "electronics.png",
    "raw_food.jpg",
    "fmcg.png",
    "clothing.jpg",
    "footwear.jpg",
    "sports.jpg",
    "furniture.png",
    "kitchen.png",
    "toys.jpg",
    "firecrackers.jpg"
  ];

  List<int> time = [240,750,850,230,420,350,740,600,210,300];
  
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Align(
        alignment: Alignment.center,
              child: Text("Categories",style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
      ),
      Container(
    height: 120,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 20);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/" + images[index]),
                height: 100,
                width: 100,
              ),
              Text(names[index])
            ],
          ),
        );
      },
    )),
      Divider(
        height: 10,
        thickness: 1.5,
        color: Colors.orange[400],
      ),
      // Text("Popular Items"),
      // Container(
      //     height: 150,
      //     child: PageView.builder(
      //         itemCount: names.length,
      //         itemBuilder: (context, index) {
      //           return Container(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               children: [
      //                 Image(
      //                   image: AssetImage("assets/" + images[index]),
      //                   height: 120,
      //                   width: MediaQuery.of(context).size.width - 40,
      //                 ),
      //                 Text(names[index])
      //               ],
      //             ),
      //           );
      //         })),
      // Divider(
      //   height: 20,
      //   thickness: 1.5,
      //   color: Colors.orange[400],
      // ),
      Expanded(
              child: ListView.separated(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 10,
          separatorBuilder: (BuildContext context,int index){
    return SizedBox(
        height:20
    );
          },
          itemBuilder: (BuildContext context,int index){
          return Container(
          width: 400,
         height: 460,
          child: WidgetFlipper(image:"assets/" + images[index],time:time[index]),
        );
        }),
      )
      
    ]),
        );
  }
}
