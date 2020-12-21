
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UCardView extends StatefulWidget {
 
  final String image;
  final String name;
  const UCardView({
    Key key,
   
    this.image,
    this.name,
  }) : super(key: key);
  @override
  _UCardViewState createState() => _UCardViewState();
}

class _UCardViewState extends State<UCardView> {

  

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow:[
                BoxShadow(color: Colors.orange[400],
                spreadRadius: .5,
                blurRadius: 2),
                
              ]
            ),
            padding: EdgeInsets.symmetric(vertical:5,horizontal:10),
              child: Column(
            children: [
              Center(child: Text(widget.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),)),
              Card(
                elevation: 5,
                shadowColor: Colors.orange[400],
                              child: Container(
                  
                  height: 250,
                  child: Stack( children: [
                    Center(
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(widget.image),
                      ),
                    ),
                    Align(alignment: Alignment.topLeft, child: Container(
                      width: 80,
                      padding: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Text("ProductId"))),
                  ]),
                ),
              ), 
              Divider(color: Colors.orange[400],),
              Text("Lorem Ipsum is simply dummy text of the printing and typeseting industry. Lorem Ipsum is simply dummy text of the printing and typeseting industry."),
        Divider(color: Colors.orange[400],),
              Text("Amount"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  FlatButton(child:Text("Turn Out",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ))
                  ,onPressed: null,),
                  IconButton(icon: Icon(Icons.qr_code_scanner ),onPressed: ()async{
                    if(await Permission.camera.request().isGranted){
                    String qr  = await  scanner.scan();
                    print("QRcode- ${qr}");
                    }
                    else 
                      print("Error");
                  })
                ]
              )
            
            ],
          ));

  }
}