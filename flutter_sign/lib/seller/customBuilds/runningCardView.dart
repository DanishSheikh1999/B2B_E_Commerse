import 'dart:async';

import 'package:flutter/material.dart';

class RCardView extends StatefulWidget {
  final int time;
  final String image;
  final String name;
  const RCardView({
    Key key,
    this.time,
    this.image,
    this.name,
  }) : super(key: key);
  @override
  _RCardViewState createState() => _RCardViewState();
}

class _RCardViewState extends State<RCardView> {

   int _start ;
  int minutes,seconds;
  
  Timer _timer;

void startTimer() {
  _start = widget.time;
  const oneSec = const Duration(seconds: 1);
  _timer = new Timer.periodic(
    oneSec,
    (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
          minutes = (_start~/60) ;
          seconds = _start- minutes*60;
        });
      }
    },
  );
}
@override
 void initState(){
   super.initState();
   startTimer();
 }

 @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
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
                      width: 70,
                      padding: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Text("$minutes:$seconds"))),
                  ]),
                ),
              ), 
              Divider(color: Colors.orange[400],),
              Text("Lorem Ipsum is simply dummy text of the printing and typeseting industry. Lorem Ipsum is simply dummy text of the printing and typeseting industry."),
        Divider(color: Colors.orange[400],),
               Container(
                        width: 300,
                        height: 40,
                        child: Stack(fit: StackFit.expand, children: [
                          
                          LinearProgressIndicator(
                            value: .3,  //Needs to be updated as the orders are stacked or new orders are generated ranges between 0 to 1 .
                            backgroundColor: Colors.white, // The total amount is to be taken from the seller .....the amount ordered / total amount goes into the value portion.
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.orange[100]),
                          ),
                          Center(child: Text("Unit Amount")),  // Amount from cloud to be written here
                        ]),
                      ),
            ],
          ));

  }
}