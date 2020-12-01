import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:flutter_sign/custom_classes/credentials.dart';

class User_type extends StatefulWidget {
  final Credentials cred;

  const User_type({Key key, this.cred}) : super(key: key);
  @override
  _User_typeState createState() => _User_typeState();
}

class _User_typeState extends State<User_type> {
  bool exporter=false,importer=false,retailer=false,mnf=false;
  List<String> result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar(
            backgroundColor:Colors.orange[400],
            leading:IconButton(
              icon: Icon(Icons.arrow_back,color:Colors.white),
              onPressed: ()=>{
                Navigator.pop(context)
                },
            )
          ) ,
          body: Container(
          padding:  EdgeInsets.symmetric(vertical:100,horizontal:40),
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: <Color>[
              Colors.orange[500],
                  Colors.orange[600],
                  Colors.orange[600],
                  Colors.orange[700],
            ],)
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text("Please select your",
            style: TextStyle(
              color:Colors.white,
              fontSize: 20,
            ),),
            SizedBox(height:20),
            Text("User Type",
            style: TextStyle(
              fontSize: 32,
              color:Colors.white,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 40,),
            Column(
              children:[
                    Custom_switch_tile(
                      title: Text("Retailer",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      )),
                      value: retailer,
                      onchanged: (bool value){
                        if(value)
                          result.remove("retailer");
                        else
                          result.add("retailer");
                        setState(() {
                          retailer  = value;
                        });
                      }),
                      SizedBox(height:30),
                      Custom_switch_tile(
                      title: Text("Exporter",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      )),
                      value: exporter,
                      onchanged: (bool value){
                        if(value)
                          result.remove("exporter");
                        else
                          result.add("exporter");
                        setState(() {
                          exporter  = value;
                        });
                      }),

                      SizedBox(height:30),
                      Custom_switch_tile(
                      title: Text("Importer",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      )),
                      value: importer,
                      onchanged: (bool value){
                        if(value)
                          result.remove("importer");
                        else
                          result.add("importer");
                        setState(() {
                          importer  = value;
                        });
                      }),
                      SizedBox(height:30),
                      Custom_switch_tile(
                      title: Text("Manufacturer",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 24
                      )),
                      value: mnf,
                      onchanged: (bool value){
                        if(value)
                          result.remove("manufacturer");
                        else
                          result.add("manufacturer");
                        setState(() {
                          mnf  = value;
                        });
                      })
              ]
            ),
            SizedBox(
              height:30,
            ),
            RoundedButton(
                              onPressed: ()  {
                                widget.cred.setuserType(result);
                                print(widget.cred.toString());
                              },
                              width_ratio: 1.2,
                              padding: EdgeInsets.symmetric(vertical:12),
                              text: Text("Continue",
                              style:TextStyle(
                                color: Colors.orange[600],
                                fontSize: 20
                              ),),
                              color: Colors.white,
                            ),
          ]
        ),
      ),
    );
  }
}

class Custom_switch_tile extends StatefulWidget {
  final Function onchanged;
  final bool value;
  final Text title;
  const Custom_switch_tile({
    Key key,
   @required this.onchanged,
    this.value,
    this.title,
  }) : super(key: key);

  @override
  _Custom_switch_tileState createState() => _Custom_switch_tileState();
}

class _Custom_switch_tileState extends State<Custom_switch_tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                        color: Colors.orange[400],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          color: Colors.orange[700],
                           blurRadius: 3,
                          spreadRadius: 3
                        )]
                      ),
                      child: SwitchListTile(
                        activeColor: Colors.white,
                        title: widget.title,
                        value:widget.value, 
                      onChanged:widget.onchanged)
                      );
  }
}