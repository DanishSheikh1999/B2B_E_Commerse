import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
      title: Text(
        "Home",
        style: TextStyle(color: Colors.amberAccent[200]),
      ),
      actions: [
        FlatButton.icon(
            onPressed: () async {
               await _auth.signOut();
              final user = Provider.of<User>(context,listen: false);
               if(user==null)
                 Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context)=>Authenticate()));
               print(user);
            },
            icon: Icon(Icons.person),
            label: Text("Sign Out",
                style: TextStyle(color: Colors.amberAccent[400])))
      ],
      backgroundColor: Colors.grey[800],
    ));
  }
}
