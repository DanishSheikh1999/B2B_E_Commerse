import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sign/custom_classes/search.dart';
import 'package:flutter_sign/screens/authenticate/authenticate.dart';
import 'package:flutter_sign/screens/home/home.dart';
import 'package:flutter_sign/screens/home/profile.dart';
import 'package:flutter_sign/screens/home/search.dart';
import 'package:flutter_sign/screens/wrapper.dart';
import 'package:flutter_sign/services/firebase_auth.dart';
import 'package:provider/provider.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  int selectedIndex=0;
  final AuthService _auth = AuthService();
  final List<Widget> tabPages =<Widget>[
      Home(),
      SearchPage(),
      Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
   
    return 
    
    Scaffold(
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
    backgroundColor: Colors.white,
      title: Text(
        "App Name",
        style: TextStyle(color: Colors.white),
      ),
      //iconTheme: IconThemeData(color: Colors.orange[400]),
      actions: [
        // IconButton(icon: Icon(Icons.search), onPressed: (){
        //   showSearch(context: context, delegate: Search(hintText:"What are you looking for?"));
        // }),
         Center(
          child:Text("Trending",style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),)),
          SizedBox(width:10),
        Center(
          child:Text("Strategy",style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),)),
        IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white
      ), onPressed: null)

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
             ListTile(title:Text("Logout"),
             onTap: () async{
               dynamic data=await _auth.signOut();
               print(data);
             },),

        ],)
    ),
    bottomNavigationBar: BottomNavigationBar(
      //backgroundColor: Colors.orange[400],
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notification")
      ],
      currentIndex: selectedIndex,
        selectedItemColor: Colors.orange[400],
        // unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        mouseCursor: MouseCursor.uncontrolled,
    ),
    body:tabPages.elementAt(selectedIndex)
    //  Padding(
    //   padding: EdgeInsets.all(20),
    //       child: Stack(
    //     children:[
    //       Container(
    //         height: 100,
    //         child: ListView.separated(
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: 10,
    //                     separatorBuilder: (BuildContext context, int index) {
                        
    //                       return  SizedBox(width:20);
    //                     },
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return Card(
    //                         elevation: 10,
    //                         child: Text("item $index product photo etc"),
    //                       );
    //                     },
    //                   )
    //       )
    //     ]
    //   ),
    // )
    );
  }

}
