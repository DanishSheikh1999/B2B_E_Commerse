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
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[500],
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) =>
                                      email.isEmpty ? "Enter an email" : null,
                                  onChanged: (value) =>
                                      {setState(() => email = value)},
                                  decoration: InputDecoration(
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedFormField(
                              textFormField: TextFormField(
                                obscureText: true,
                                  validator: (value) => password.length < 6
                                      ? "Enter a password of length > 6"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => password = value)},
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(height :20,

                            ),

                             RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) => (confirm_password!="" && confirm_password!=password && confirm_password.length<6)
                                      ? "Please check the password"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => password = value)},
                                  decoration: InputDecoration(
                                      hintText: "Confirm Password",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 30,
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
                              text: Text("Continue",
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ),),
                              gradient: signUpGradients,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "or",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                             RaisedButton(
                              onPressed: () async {
                                dynamic usercred = await _auth.googleSignIn();
                                if(usercred==null)
                                  print("Error");
                                else 
                                  print(usercred);
                              },
                              padding: const EdgeInsets.all(0.0),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width / 1.7,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage("assets/Google_logo.png"),
                                      width: 20,
                                    ),
                                    Text("Continue with Google",
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                  ],
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
