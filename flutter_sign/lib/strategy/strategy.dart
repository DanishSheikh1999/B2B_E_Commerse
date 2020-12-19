import 'package:flutter/material.dart';
import 'package:flutter_sign/Custom_builds/rounded_button_with_gradient.dart';
import 'package:flutter_sign/screens/home/tabPage.dart';
import 'package:flutter_sign/strategy/other_videos.dart';
import 'package:video_player/video_player.dart';

class Strategy_Page extends StatefulWidget {
  @override
  _Strategy_PageState createState() => _Strategy_PageState();
}

class _Strategy_PageState extends State<Strategy_Page> {
  bool eng = false;
  bool hindi  =false;
  VideoPlayerController _controller;
  Future<void> _intializeVideoPlayer;
  String lang  = "";
  void startVideo(String location){
    final controller = VideoPlayerController.asset(location);
    final old = _controller;
  if (old != null) {
    old.pause(); // mute instantly
  }
  _controller = controller;
    _controller = VideoPlayerController.asset(location);
    _intializeVideoPlayer = _controller.initialize();
    _controller.play();
  }
  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Skip to Home page'),
        content: Text("Watch Strategy Videos later!!"),
        actions: <Widget>[
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, 
                                  MaterialPageRoute(builder: (context)=>TabPage()),
                                  (Route<dynamic> route) => false);
                       
            },),
          TextButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

 @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.orange[400],
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: (){_showMyDialog(context);},),
        ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical:10,horizontal:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                 elevation:5,
                 shadowColor:Colors.orange[400],
                 child:Container(
                   padding: EdgeInsets.all(10),
                   width: MediaQuery.of(context).size.width-50,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("Why Strategy?",
                       style: TextStyle(
                         color: Colors.orange[400],
                         fontSize: 24,
                         fontWeight: FontWeight.bold
                       ),),
                       SizedBox(height:20),
                       Text("Lorem Ipsum is simply dummy text of the printing and typeseting industry."),
                       SizedBox(height:20),
                      GestureDetector(
                        onTap: (){
                           setState(() {
                             eng = !eng;

                           });},
                         child: Stack(
                          alignment: AlignmentDirectional.center,
                          children:[
                            FutureBuilder(
                                  future: _intializeVideoPlayer,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done && lang == "English" && _controller!=null) {
                                      // If the VideoPlayerController has finished initialization, use
                                      // the data it provides to limit the aspect ratio of the VideoPlayer.
                                      return Container(
                                        width: 300,
                                        height:200,
                                        child: AspectRatio(
                                          aspectRatio: _controller.value.aspectRatio,
                                          // Use the VideoPlayer widget to display the video.
                                          child: VideoPlayer(_controller),
                                        ),
                                      );
                                  } else {
                                      // If the VideoPlayerController is still initializing, show a
                                      // loading spinner.
                                      return Container(
                                        width: 300,
                                        height: 200,
                                        child: Image(image: AssetImage("assets/v1t.jpg")),
                                      );
                                  }
                                },
                              ),
                              Visibility(  
                                 visible: eng,                                                       
                                 child: Container(
                                   
                                  decoration: ShapeDecoration(
                                    color:Colors.grey[400],
                                    shape:CircleBorder()
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                          lang = "English";
                                      });
                                      if(_controller == null )
                                          startVideo("assets/v1.mp4");
                                    
                                      else{
                                      setState(() {
                                          if (_controller.value.isPlaying) {
                                            _controller.pause();
                                          } else {
                                    
                                            _controller.play();
                                          }
                                      });}
                                    },
                                    icon: Icon(
                                         lang =="English" && _controller.value.isPlaying ? Icons.pause :Icons.play_arrow,
                                       color: Colors.white
                                    ),),
                                ),
                              )
                                                      ]
                        ),
                      )
                       
                     ],),
                 )
               ),
               SizedBox(height:20),
               Card(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                 elevation:5,
                 shadowColor:Colors.orange[400],
                 child:Container(
                      padding: EdgeInsets.all(10),
                   width: MediaQuery.of(context).size.width-50,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("रणनीति क्यों?",
                       style: TextStyle(
                         color: Colors.orange[400],
                         fontSize: 24,
                         fontWeight: FontWeight.bold
                       ),),
                       SizedBox(height:20),
                       Text("लोरम इप्सम केवल मुद्रण और टंकण उद्योग का डमी पाठ है|"),
                       SizedBox(height:40),

                       GestureDetector(
                         onTap: (){
                           setState(() {
                             hindi = !hindi;

                           });
                         },
                                                child: Stack(
                           alignment: AlignmentDirectional.center,
                           children: [
                             FutureBuilder(
                 future: _intializeVideoPlayer,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done && lang =="Hindi"&& _controller!=null) {
        // If the VideoPlayerController has finished initialization, use
        // the data it provides to limit the aspect ratio of the VideoPlayer.
        return Container(
          width: 300,
          height: 200,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: VideoPlayer(_controller),
          ),
        );
    } else {
        // If the VideoPlayerController is still initializing, show a
        // loading spinner.
        return Container(
          width: 300,
          height: 200,
          child: Image(image: AssetImage("assets/v1t.jpg")),
        );
    }
  },
),Visibility(
  visible: hindi,
  child:   Container(
    decoration: ShapeDecoration(
                                    color:Colors.grey[400],
                                    shape:CircleBorder()
                                  ),
    child:   IconButton(
      onPressed: () {
         setState(() {
            lang = "Hindi";
        });
        if(_controller == null)
            startVideo("assets/v1.mp4");
        else{
        setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
      
              _controller.play();
            }
        });}
      },
      icon: Icon(
          lang =="Hindi" &&_controller.value.isPlaying ? Icons.pause :Icons.play_arrow,
      color: Colors.white,),),
  ),
)
                            ] ),
                       ),
 
                     ],),
                 )
               ),
               SizedBox(height: 20,),
               Align(
                 alignment: Alignment.bottomCenter,
                 
               child:RoundedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Other_Videos()));
                                },
                                width_ratio: 1.2,
                                padding: EdgeInsets.symmetric(vertical:12),
                                text: Text("Watch More",
                                style:TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                ),),
                                color: Colors.orange[400]
                              ),
               )
            ],
          ),),
      ),
    );
  }
}