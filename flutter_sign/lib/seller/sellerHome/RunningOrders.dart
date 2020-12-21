import 'package:flutter/material.dart';
import 'package:flutter_sign/seller/customBuilds/runningCardView.dart';

class RunningOrders extends StatefulWidget {
  @override
  _RunningOrdersState createState() => _RunningOrdersState();
}

class _RunningOrdersState extends State<RunningOrders> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:10,horizontal:20),
      child:ListView.separated(
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
         height: 420,
          child: RCardView(image:"assets/" + images[index],time:time[index],name: names[index],),
        );
        }),
    );
  }
}