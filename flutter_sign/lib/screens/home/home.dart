import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign/custom_classes/search.dart';
import 'package:flutter_sign/screens/authenticate/authenticate.dart';
import 'package:flutter_sign/screens/wrapper.dart';
import 'package:flutter_sign/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final AuthService _auth = AuthService();

  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                Colors.orange[500],
                  Colors.orange[600],
                  Colors.orange[600],
                  Colors.orange[700],
            ])          
         ),        
     ),      
      title: Text(
        "Home",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: (){
          showSearch(context: context, delegate: Search(hintText:"What are you looking for?"));
        }),
        IconButton(icon: Icon(Icons.notifications,color: Colors.white,), onPressed: null),
        IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: null)

      ],
    ),
    drawer: Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: ListTile(leading: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image(image:AssetImage("assets/pf.png"))),title: Text("Danish Sheikh"),subtitle: Text("Level 2 Ninja"),)),
          ListTile(title:Text("My Profile")),
          ListTile(title:Text("My Transactions")),
          ListTile(title:Text("Notifications")),
          ListTile(title:Text("Strategy Video")),
          ListTile(title:Text("Payment Options")),
          ListTile(title:Text("Settings")),
           ListTile(title:Text("Invite to earn")),
            ListTile(title:Text("Customer Support")),
             ListTile(title:Text("Logout")),

        ],)
    ),
    body: Padding(
      padding: EdgeInsets.all(20),
          child: Stack(
        children:[
          Container(
            height: 100,
            child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        separatorBuilder: (BuildContext context, int index) {
                        
                          return  SizedBox(width:20);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 10,
                            child: Text("item $index product photo etc"),
                          );
                        },
                      )
          )
        ]
      ),
    ),);
  }
}
