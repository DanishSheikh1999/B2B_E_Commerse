
class Credentials {
  String uid,name,phone,address,pincode,picUrl,category;
  List<String> userType;

 // File image;
  Credentials({
    this.name,phone,uid,address,pincode,picUrl,category,
    this.userType
  });

  void setuserType(List<String> value) => this.userType = value;
  void setcategory(String value) => this.category = value;
  void setUid(String value) => this.uid = value;
  String getUid() {return this.uid;}
  
  
  
}


  


