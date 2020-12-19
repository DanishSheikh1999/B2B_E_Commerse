import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sign/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sign/screens/authenticate/registration_continued.dart';
import 'package:flutter_sign/services/database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home/tabPage.dart';

class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null){
      return Authenticate();
    }
    else {
      dynamic registered = check(user.uid);
      if(registered!=null)
          return TabPage();
      else
        return SignUp_C(uid:user.uid);
  }
}}

Future check(String uid) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool registered = pref.getBool("Registered")!=null?pref.getBool("Registered"):false;
  print("Registered : "+registered.toString());
  dynamic data = await DatabaseService(uid:uid).isthere();
  if(data!=null)
    return data;
  if(registered)
    return null ;
  else 
    return true;
  
}