import 'package:flutter/material.dart';
import 'package:flutter_sign/screens/authenticate/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sign/screens/authenticate/registration_continued.dart';
import 'package:flutter_sign/services/database.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null){
      return Authenticate();
    }
    else {
      dynamic registered = check(user.uid);
      if(registered==null)
          return Home();
      else
        return SignUp_C(uid:user.uid);
  }
}}

Future check(String uid) async{
  return await DatabaseService(uid:uid).isthere();
}