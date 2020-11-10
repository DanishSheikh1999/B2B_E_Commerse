import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/custom_form_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sign/screens/authenticate/registration_continued.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:flutter_sign/services/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "", password = "";
  String name="";
  String phone_number="";
  String error = "";
  String confirm_password="";
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
                        "Sign Up",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "It all starts here",
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
                    padding: EdgeInsets.only(top:20,left:40,right: 40),
                   
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                    
                            SizedBox(
                              height: 20,
                            ),
                            RoundedFormField(
                              text: Text("Email",style: TextStyle(color: Colors.white,
                              fontSize: 15),),
                              backgroundColor: Colors.orange[400],
                              textFormField: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                  validator: (value) =>
                                      email.isEmpty ? "Enter an email" : null,
                                  onChanged: (value) =>
                                      {setState(() => email = value)},
                                  decoration: InputDecoration(
                                    
                                    icon: Icon(Icons.email,color: Colors.white,),
                                      hintText: "Email",
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
                              textFormField: TextFormField(
                                cursorColor: Colors.white,
                                
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                  validator: (value) => password.length < 6
                                      ? "Enter a password of length > 6"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => password = value)},
                                  decoration: InputDecoration(
                
                                    icon: Icon(Icons.lock,color: Colors.white,),
                                      hintText: "Password",
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
                                backgroundColor: Colors.orange[400],
                            ),
                            SizedBox(height :20,

                            ),

                             RoundedFormField(
                              textFormField: TextFormField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                  validator: (value) => (confirm_password!="" && confirm_password!=password && confirm_password.length<6)
                                      ? "Please check the password"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => password = value)},
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.lock_outline,color: Colors.white,),
                                      hintText: "Confirm Password",
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
                                backgroundColor: Colors.orange[400],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            RoundedButton(
                              onPressed: () async {
                                if (_formkey.currentState.validate()) {
                                  dynamic result =
                                      await _auth.signUpemail(email, password);
                                  if (result == null){
                                    setState(() =>
                                        error = "Please enter a valid email");
                                  print("Error - " + error);}
                                  else  {
                                     Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => SignUp_C(uid:result.toString())));}
                                }
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
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "-or-",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                             RaisedButton(
                              onPressed: () async {
                                dynamic usercred = await _auth.googleSignIn();
                                if(usercred==null)
                                  print("Error");
                                else {
                                 Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => SignUp_C(uid:usercred.toString())));}
                                  
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
                                padding: EdgeInsets.only(top: 16, bottom: 16),
                              ),
                            )
                            ,SizedBox(
                              height:20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
