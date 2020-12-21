import 'package:flutter/material.dart';
import 'package:flutter_sign/seller/analysis.dart';
import 'package:flutter_sign/seller/sellerHome.dart';
import 'package:flutter_sign/seller/sellerNotifications.dart';


class SellerTab extends StatefulWidget {
  @override
  _SellerTabState createState() => _SellerTabState();
}

class _SellerTabState extends State<SellerTab> {
  int selectedIndex = 0;
  final List<Widget> tabpages = [
    SellerHome(),
    SellerAnalysis(),
    SellerNotifications()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("AppName"),
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
         )       
          ,),
      ),
      drawer: Drawer(

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics),label:"Analysis"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications),label:"Notifications"),
        ],),

      body: tabpages.elementAt(selectedIndex),
    );
  }
}