
import 'package:flutter/material.dart';

class Category_Selection extends StatefulWidget {
  @override
  _Category_SelectionState createState() => _Category_SelectionState();
}

class _Category_SelectionState extends State<Category_Selection> {
  List<String> names = ["Electronics","Raw Food","FMCG","Clothing","Footwear","Sports","Furniture","Home & Kitchen","Toys","Seasonal Goods"];
  List<String> images = ["electronics.png","raw_food.jpg","fmcg.png","clothing.jpg","footwear.jpg","sports.jpg","furniture.png","kitchen.png","toys.jpg","firecrackers.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[400],
          leading:
            IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context))
        ,
          centerTitle: true,
          title: Text("Choose Your Category",
          style: TextStyle(
            color: Colors.white
          ),)
          ,),
        body: Container(
          
          padding: EdgeInsets.symmetric(vertical:50,horizontal:30),
          child:GridView.builder(
                padding: EdgeInsets.all(5),
                itemCount:names.length ,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 30),
                itemBuilder: (context,index){
                  return Container(
                    
                    decoration:BoxDecoration(
                    color: Colors.white,
                    boxShadow :[
                      BoxShadow(
                        color: Colors.orange[200],
                        blurRadius: 1,
                                spreadRadius: 1
                      )
                    ],),
                    child: GridTile(
                      footer: Center(child: Text(names[index],
                      style: TextStyle(
                        fontSize: 18,
                        color:Colors.orange[700]
                      ),)),
                      child: Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  child: Image(
                                    image:
                                        AssetImage("assets/"+images[index]),
                                    fit: BoxFit.contain,
                                  ),
                                  padding: EdgeInsets.only(top: 16, bottom: 16),
                                ),
                    ),
                  );
                })
            
          )
        
    );
  }
}