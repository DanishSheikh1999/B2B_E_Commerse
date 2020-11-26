import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sign/custom_classes/credentials.dart';


class DatabaseService{
  DatabaseService({this.uid});
  final String uid;
  final CollectionReference users = FirebaseFirestore.instance.collection("Users");


  Future updateUsers(Credentials cred) async{
    return await users.doc(uid).set({
      "Name":cred.name,
      "Phone_Number":cred.phone,
      "Address":cred.address,
      "Pincode":cred.pincode,
      "PicUrl":cred.picUrl
    }
    );

  }

  Future isthere() async{
    DocumentSnapshot data = await users.doc(uid).get();
    print(data.exists);
    if(data==null)
      return null;
    else return data;
  }
}