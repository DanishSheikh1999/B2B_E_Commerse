import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:flutter_sign/screens/authenticate/register.dart';
import 'package:flutter_sign/screens/authenticate/registration_continued.dart';
import 'package:flutter_sign/screens/authenticate/signAnon.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    // return Scaffold(
    //   body: SignInAnon(),
    // );
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: <Color>[
              Colors.orange[500],
                  Colors.orange[600],
                  Colors.orange[600],
                  Colors.orange[700],
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/cart.png"),
                      height: 60,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              RoundedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
               text: Text(
                 "Let's get started",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 15,
                 ),
               ),
                gradient: signInGradients,
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInAnon()));
                },
                text: Text(
                 "Already have an account?",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 15,
                 ),),
                gradient: signInGradients,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          )),
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];
