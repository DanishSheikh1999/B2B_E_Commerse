
import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/custom_form_fields.dart';
import 'package:flutter_sign/custom_classes/credentials.dart';
import 'package:flutter_sign/screens/home/home.dart';
import 'package:flutter_sign/services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:firebase_storage/firebase_storage.dart';


import 'dart:io';

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
  Map<String,int> lengths =    {"phone":1,
                                          "gst":1,
                                          "pan":1,
                                          "pincode":1};

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
   print(picUrl);
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
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
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
                            RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) =>
                                      name.isEmpty ? "Enter Name" : null,
                                  onChanged: (value) =>
                                      {setState(() => name = value)},
                                  decoration: InputDecoration(
                                      hintText: "Name",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) => phone_number.length !=lengths["phone"]
                                      ? "Enter a valid phone number"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => phone_number= value)},
                                  decoration: InputDecoration(
                                      hintText: "Phone number",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) => gst.length !=lengths["gst"]
                                      ? "Enter a gst number"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => gst= value)},
                                  decoration: InputDecoration(
                                      hintText: "GST Number",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) => pan.length !=lengths["pan"]
                                      ? "Enter a valid pan number"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => pan= value)},
                                  decoration: InputDecoration(
                                      hintText: "PAN Number",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RoundedFormField(
                              textFormField: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                  validator: (value) => address_line.isEmpty
                                      ? "Enter Address"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => address_line= value)},
                                  decoration: InputDecoration(
                                      hintText: "Address",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 20,
                            ),RoundedFormField(
                              textFormField: TextFormField(
                                  validator: (value) => pincode.length!=lengths["pincode"]
                                      ? "Enter a valid pincode"
                                      : null,
                                  onChanged: (value) =>
                                      {setState(() => pincode= value)},
                                  decoration: InputDecoration(
                                      hintText: "Pincode",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]),
                                      border: InputBorder.none)),
                              edgeInsets: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              borderRadius: 30,
                              boxShadow: BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 10,
                                  offset: Offset(0, 10)),
                            ),
                            SizedBox(
                              height: 30,
                            ),RoundedButton(
                              onPressed: () async {
                                if (_formkey.currentState.validate() && _image!=null) {
                                  uploadImage();
                                  await DatabaseService(uid:widget.uid).updateUsers(Credentials(
                                    name: name,phone: phone_number,pan: pan,gst: gst,pincode: pincode,
                                    address: address_line,picUrl: picUrl
                                  ));
                                  
                                  Navigator.pushReplacement(context, 
                                  MaterialPageRoute(builder: (context)=>Home()));
                                }
                              },
                              text: Text("Register",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15                              ),),
                              gradient: signUpGradients,
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
