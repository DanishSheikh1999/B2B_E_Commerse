
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/custom_form_fields.dart';
import 'package:flutter_sign/custom_classes/credentials.dart';
import 'package:flutter_sign/screens/home/home.dart';
import 'package:flutter_sign/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:firebase_storage/firebase_storage.dart';


import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class SignUp_C extends StatefulWidget {
  SignUp_C({this.uid});
  
  @override
  _SignUpState createState() => _SignUpState();
  final String uid;
}

class _SignUpState extends State<SignUp_C> {
  final _formkey = GlobalKey<FormState>();
  String name="",phone_number="",gst="",pan="",address_line="";
  String pincode="",picUrl="";
  String error = "";
  File _image=null;
  Map<String,int> lengths =    {"phone":1,"pincode":1};

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  uploadImage() async{
    final Reference ref = FirebaseStorage.instance.ref().child('/profilepics/${widget.uid}.jpg');
   await ref.putFile(_image);
   picUrl = (await ref.getDownloadURL()).toString();
   print("PicUrl - "+picUrl);
  }
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Center(
                    child: Container(
      width: 120,
      height: 120,
      alignment: Alignment.bottomRight,
      child: IconButton(
      icon: Icon(Icons.insert_photo),
      onPressed: () async{
          getImage();          
      },
      color: Colors.white,),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
          fit: BoxFit.fill,
          image: _image==null?AssetImage("assets/pf.png"):FileImage(_image),
                 )
)),
                  )
                ),
               
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal:40),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            RoundedFormField(
                              textFormField: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.name,
                                  validator: (value) =>
                                      name.isEmpty ? "Enter Name" : null,
                                  onChanged: (value) =>
                                      {setState(() => name = value)},
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      hintStyle:
                                          TextStyle(color: Colors.white),
                                      border: InputBorder.none)),
                              backgroundColor: Colors.orange[400],
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
                              height: 10,
                            ),
                            RoundedFormField(
                             
                              textFormField: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                  validator: (value) => phone_number.length !=lengths["phone"]
                                      ? "Enter a valid phone number"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => phone_number= value)},
                                  decoration: InputDecoration(
                                      hintText: "Phone number",
                                      hintStyle:
                                          TextStyle(color: Colors.white),
                                      border: InputBorder.none)),
                              backgroundColor: Colors.orange[400],
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
                              height: 10,),
                            // ),RoundedFormField(
                            //   textFormField: TextFormField(
                            //     cursorColor: Colors.white,
                            //     style: TextStyle(color: Colors.white),
                            //     keyboardType: TextInputType.text,
                            //       validator: (value) => gst.length !=lengths["gst"]
                            //           ? "Enter a gst number"
                            //           : null,
                            //       onChanged: (value) =>
                            //           {setState(() => gst= value)},
                            //       decoration: InputDecoration(
                            //           hintText: "GST Number",
                            //           hintStyle:
                            //               TextStyle(color: Colors.white),
                            //           border: InputBorder.none)),
                            //  backgroundColor: Colors.orange[400],
                            //   edgeInsets: EdgeInsets.symmetric(
                            //     vertical: 5, horizontal: 10),
                            // borderRadius: 10,
                            // boxShadow: BoxShadow(
                            //     color: Colors.orange[700],
                            //     blurRadius: 3,
                            //     spreadRadius: 3
                            //     ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),RoundedFormField(
                            //   textFormField: TextFormField(
                            //     cursorColor: Colors.white,
                            //     style: TextStyle(color: Colors.white),
                            //     keyboardType: TextInputType.text,
                            //       validator: (value) => pan.length !=lengths["pan"]
                            //           ? "Enter a valid pan number"
                            //           : null,
                            //       onChanged: (value) =>
                            //           {setState(() => pan= value)},
                            //       decoration: InputDecoration(
                            //           hintText: "PAN Number",
                            //           hintStyle:
                            //               TextStyle(color: Colors.white),
                            //           border: InputBorder.none)),
                            //   backgroundColor: Colors.orange[400],
                            //   edgeInsets: EdgeInsets.symmetric(
                            //     vertical: 5, horizontal: 10),
                            // borderRadius: 10,
                            // boxShadow: BoxShadow(
                            //     color: Colors.orange[700],
                            //     blurRadius: 3,
                            //     spreadRadius: 3
                            //     ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            RoundedFormField(
                              textFormField: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.multiline,
                                maxLines: 2,
                                  validator: (value) => address_line.isEmpty
                                      ? "Enter Address"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => address_line= value)},
                                  decoration: InputDecoration(
                                      hintText: "Address",
                                      hintStyle:
                                          TextStyle(color: Colors.white),
                                      border: InputBorder.none)),
                              backgroundColor: Colors.orange[400],
                              edgeInsets: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            borderRadius: 10,
                            boxShadow: BoxShadow(
                                color: Colors.orange[800],
                                blurRadius: 3,
                                spreadRadius: 3
                                ),
                            ),
                            SizedBox(
                              height: 20,
                            ),RoundedFormField(
                              textFormField: TextFormField(
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                  validator: (value) => pincode.length!=lengths["pincode"]
                                      ? "Enter a valid pincode"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => pincode= value)},
                                  decoration: InputDecoration(
                                      hintText: "Pincode",
                                      hintStyle:
                                          TextStyle(color: Colors.white),
                                      border: InputBorder.none)),
                              backgroundColor: Colors.orange[400],
                              edgeInsets: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            borderRadius: 10,
                            boxShadow: BoxShadow(
                                color: Colors.orange[800],
                                blurRadius: 3,
                                spreadRadius: 3
                                ),
                            ),
                            SizedBox(
                              height: 30,
                            ),RoundedButton(
                              onPressed: () async {
                                FirebaseAuth.instance.currentUser.reload();
                              User user =FirebaseAuth.instance.currentUser;
                              print(user.emailVerified);
                              if( user.emailVerified){  
                                if (_formkey.currentState.validate() && _image!=null) {
                                  await uploadImage();
                                  await DatabaseService(uid:widget.uid).updateUsers(Credentials(
                                    name: name,phone: phone_number,pincode: pincode,
                                    address: address_line,picUrl: picUrl
                                  ));
                                  SharedPreferences pref = await SharedPreferences.getInstance();
                                  pref.setBool("Registered", true);
                                  Navigator.pushReplacement(context, 
                                  MaterialPageRoute(builder: (context)=>Home()));
                                }
                              }
                              else 
                                print("Please verify the email");

                                
                              },
                              padding: EdgeInsets.symmetric(vertical:12),
                              text: Text("Register",
                              style: TextStyle(
                                color: Colors.orange[600],
                                fontSize: 20                              ),),
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            
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
