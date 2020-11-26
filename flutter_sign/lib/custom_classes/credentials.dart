
class Credentials{
  String name,phone,gst,pan,address,pincode,picUrl;

 // File image;
  Credentials({
    this.name,
    this.address,
    this.pincode,
    this.phone,
    this.picUrl
  
  });
}

class information {
  String uid,category;
  List<String> userTypes;
  information({
    this.uid,category,
    this.userTypes,
  });

  

}
