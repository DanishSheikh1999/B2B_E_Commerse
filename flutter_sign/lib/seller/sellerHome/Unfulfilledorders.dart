import 'package:flutter/material.dart';
import 'package:flutter_sign/seller/customBuilds/unfulfilledCardView.dart';
class UnfulfilledOrders extends StatefulWidget {
  @override
  _UnfulfilledOrdersState createState() => _UnfulfilledOrdersState();
}

class _UnfulfilledOrdersState extends State<UnfulfilledOrders> {
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
         height: 450,
          child: UCardView(image:"assets/" + images[index],name: names[index],),
        );
        }),
    );
  }
}