import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:flutter_sign/screens/home/tabPage.dart';
import 'package:flutter_sign/screens/wrapper.dart';
import 'package:flutter_sign/services/firebase_auth.dart';
import 'package:flutter_sign/Custom_builds/custom_form_fields.dart';

class SignInAnon extends StatefulWidget {
  @override
  _SignInAnonState createState() => _SignInAnonState();
}

class _SignInAnonState extends State<SignInAnon> {
  final AuthService _auth = AuthService();
  String email = "", password = "";
  final _formkey = GlobalKey<FormState>();
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
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                     child: Container(
                    padding: EdgeInsets.all(40),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Column(

                          children: [
                          SizedBox(
                            height: 50,
                          ),
                          RoundedFormField(
                            text: Text("Email",
                            
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                            ),),
                           backgroundColor: Colors.orange[400],
                            textFormField: TextFormField(
                                 cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                validator: (value) =>
                                    email.isEmpty ? "Enter an email" : null,
                                onChanged: (value) =>
                                    {setState(() => email = value)},
                                decoration: InputDecoration(
                                  icon: Icon(Icons.email,
                                  color: Colors.white,),
                                    hintText: "Enter your Email",
                                    hintStyle:
                                        TextStyle(color: Colors.white),
                                    border: InputBorder.none)),
                            edgeInsets: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            borderRadius: 10,
                            boxShadow: BoxShadow(
                                color: Colors.orange[700],
                                blurRadius: 3,
                                spreadRadius: 3
                                ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedFormField(
                            text: Text("Password",style: TextStyle(color: Colors.white,fontSize: 15),),
                            backgroundColor: Colors.orange[400],
                            textFormField: TextFormField(
                                 cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                obscureText: true,
                                validator: (value) => password.isEmpty
                                    ? "Enter a password"
                                    : null,
                                onChanged: (value) =>
                                    {setState(() => password = value)},
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock,
                                  color: Colors.white,),
                                    hintText: "Enter your Password",
                                    hintStyle:
                                        TextStyle(color: Colors.white),
                                    border: InputBorder.none)),
                            edgeInsets: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            borderRadius: 10,
                            boxShadow: BoxShadow(
                                color: Colors.orange[700],
                                blurRadius: 3,
                                spreadRadius: 3,)
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(    
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          RoundedButton(
                            color: Colors.white,
                            onPressed: () async {
                              dynamic result = await _auth.signInemail(email, password);
                              print(result.toString());
                              if(result==null)
                                print("Error");
                              else
                                Navigator.pushAndRemoveUntil(
                                                   context,
                                                  MaterialPageRoute(builder: (context) => TabPage()),
                                                  (Route<dynamic> route) => false,
                                                );
                            },
                            width_ratio: 1.2,
                            padding: EdgeInsets.symmetric(vertical :12),
                            text: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 20
                              ),
                            )
                            
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "-or-",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        
                          RaisedButton(
                              
                              onPressed: () async {
                                dynamic result = await _auth.googleSignIn();
                                if (result == null)
                                  print("Error");
                                else
                                 Navigator.pushAndRemoveUntil(
                                                   context,
                                                  MaterialPageRoute(builder: (context) => TabPage()),
                                                  (Route<dynamic> route) => false,
                                                );
                                  
                              },
                              padding: const EdgeInsets.all(0.0),
                              color: Colors.white,
                              shape: CircleBorder(),
                              child: Container(
                                alignment: Alignment.center,
                                width: 30,
                                child: Image(
                                  image:
                                      AssetImage("assets/Google_logo.png"),
                                  width: 30,
                                ),
                                padding: EdgeInsets.only(top: 10, bottom: 10),
                              )),
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}

// RoundedButton(
//                   onPressed: () async {
//             dynamic result = await _auth.signinAnon();
//             if (result == null)
//               print("error");
//             else
//               print(result);
//           },
//           title: "Login",

//                 )
const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
