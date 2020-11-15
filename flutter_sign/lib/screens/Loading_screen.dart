
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading_Screen extends StatefulWidget {
  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
           begin: Alignment.topCenter,
            colors: <Color>[
              Colors.orange[500],
                  Colors.orange[600],
                  Colors.orange[600],
                  Colors.orange[700],
            ],
        )
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
              width: 150,
              padding: EdgeInsets.all(50),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: signInGradients
                )
              ),
              child: Image(image: AssetImage("assets/cart.png"),),
            ),
            SizedBox(height:20),
            Text(
              "App Name",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),
              ],
            ),
          ),
          Expanded(
            flex: 1,    
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,      
            children:[
                SpinKitRing(
        color: Color(0xFF03A0FE)
      
            ),
             SizedBox(height:20),
            Text(
              "Moto",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),),]
          ))  
          

        ],

      ),
      )
    );
      
    
  }}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];
