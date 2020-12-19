import "package:flutter/material.dart";
import 'dart:math';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController pageController;
  // AnimationController animationController;
  // Animation<double> animation,back_animation;
  // AnimationStatus animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // animationController = AnimationController(vsync:this,duration:Duration(milliseconds: 500));

    // animation = TweenSequence(
    //   <TweenSequenceItem<double>>[
    //     TweenSequenceItem<double>(
    //       tween: Tween(begin: 0.0, end: 1.0)
    //           .chain(CurveTween(curve: Curves.easeIn)),
    //       weight: 50.0,
    //     ),
    //     TweenSequenceItem<double>(
    //       tween: ConstantTween<double>(1.0),
    //       weight: 50.0,
    //     ),
    //   ],
    // ).animate(animationController)
    // ..addListener(() {
    //   setState(() {

    //   });
    // })
    // ..addStatusListener((status) {
    //   animationStatus = status;
    // });
  }

  List<String> names = [
    "Electronics",
    "Raw Food",
    "FMCG",
    "Clothing",
    "Footwear",
    "Sports",
    "Furniture",
    "Home & Kitchen",
    "Toys",
    "Seasonal Goods"
  ];
  List<String> images = [
    "electronics.png",
    "raw_food.jpg",
    "fmcg.png",
    "clothing.jpg",
    "footwear.jpg",
    "sports.jpg",
    "furniture.png",
    "kitchen.png",
    "toys.jpg",
    "firecrackers.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text("Categories"),
          Container(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 20);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("assets/" + images[index]),
                          height: 100,
                          width: 100,
                        ),
                        Text(names[index])
                      ],
                    ),
                  );
                },
              )),
          Divider(
            height: 20,
            thickness: 1.5,
            color: Colors.orange[400],
          ),
          Text("Popular Items"),
          Container(
              height: 150,
              child: PageView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("assets/" + images[index]),
                            height: 120,
                            width: MediaQuery.of(context).size.width - 40,
                          ),
                          Text(names[index])
                        ],
                      ),
                    );
                  })),
          Divider(
            height: 20,
            thickness: 1.5,
            color: Colors.orange[400],
          ),
          Container(
            width: 400,
           height: 460,
            child: WidgetFlipper(),
          )
        ]),
      ),
    );
  }
}

class WidgetFlipper extends StatefulWidget {
  WidgetFlipper({
    Key key,
    this.frontWidget,
    this.backWidget,
  }) : super(key: key);

  final Widget frontWidget;
  final Widget backWidget;

  @override
  _WidgetFlipperState createState() => _WidgetFlipperState();
}

class _WidgetFlipperState extends State<WidgetFlipper>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> _frontRotation;
  Animation<double> _backRotation;
  bool isFrontVisible = true;
  int _start = 240;
  int minutes,seconds;
  
  Timer _timer;

void startTimer() {
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
  void initState() {
    super.initState();
    startTimer();
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
   Future<void> _showMyDialog(String titleString , String contentString) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, 
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titleString),
        content: Text(contentString),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedCard(
          animation: _backRotation,
          child: Container(
            color: Colors.yellow[200],
            child: Center(
                child: FlatButton(
                    onPressed: _leftRotation, child: Text("Calculator"))),
          ),
        ),
        AnimatedCard(
          animation: _frontRotation,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow:[
                BoxShadow(color: Colors.orange[400],
                spreadRadius: .4,
                blurRadius: 2)
              ]
            ),
            padding: EdgeInsets.symmetric(vertical:5,horizontal:10),
              child: Column(
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.orange[400],
                              child: Container(
                  
                  height: 250,
                  child: Stack( children: [
                    Center(
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/raw_food.jpg"),
                      ),
                    ),
                    Align(alignment: Alignment.topLeft, child: Container(
                      width: 50,
                      padding: EdgeInsets.all(8),
                      color: Colors.red,
                      child: Text("$minutes:$seconds"))),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.orange[400],
                        ),
                        onPressed: null,
                      ),
                    )
                  ]),
                ),
              ),
              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
  
                Text("Unit Amount"),
                IconButton(icon: Icon(Icons.info),
                onPressed: (){
                    _showMyDialog("Info about Meter","Meter description etc");
                },
                ),
                FlatButton(onPressed: _leftRotation, child: Text("Caculator")),
                FlatButton(onPressed: null, child: Text("Share"))

              ],),
              Divider(color: Colors.orange[400],),
              Text("Lorem Ipsum is simply dummy text of the printing and typeseting industry. Lorem Ipsum is simply dummy text of the printing and typeseting industry."),
              Divider(color: Colors.orange[400],),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text("Cost(Save upto Rs._____"),
                  IconButton(icon: Icon(Icons.info,),
                  onPressed: (){
                    _showMyDialog("Use Calculator for final amount", "");
                  },
                  )
                ]
              )
            ],
          )),
        ),
      ],
    );
  }

  void _leftRotation() {
    _toggleSide();
  }

  void _rightRotation() {
    _toggleSide();
  }

  void _toggleSide() {
    if (isFrontVisible) {
      controller.forward();
      isFrontVisible = false;
    } else {
      controller.reverse();
      isFrontVisible = true;
    }
  }
}

class AnimatedCard extends StatelessWidget {
  AnimatedCard({
    this.child,
    this.animation,
  });

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        var transform = Matrix4.identity();
        transform.setEntry(3, 2, 0.001);
        transform.rotateY(animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}
