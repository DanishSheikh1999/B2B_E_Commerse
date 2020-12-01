import 'package:flutter/material.dart';

class Other_Videos extends StatefulWidget {
  @override
  _Other_VideosState createState() => _Other_VideosState();
}

class _Other_VideosState extends State<Other_Videos> {
  // List<String> images = [];
  // List<String> video_name= [];
  // List<String> time =[];
  // List<String> views =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.orange[400],
        centerTitle: true,
        title: Text(
          "Other_Videos",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24
          ),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: ()=>{
                Navigator.pop(context)
                },)),
      body: ListView.separated(
              padding: EdgeInsets.all(15),
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) {
                      
                        return  SizedBox(height:20);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Image(image: AssetImage("assets/v1t.jpg"),
                              width: 250,
                              height: 200,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text("Video Title",style: TextStyle(
                                  fontSize:24
                                ),),
                                Text("Video Duration"),
                                Text("Video Views")
                              ]
                            )
                            ],),
                          ),
                        );
                      },
      )
    );
  }}