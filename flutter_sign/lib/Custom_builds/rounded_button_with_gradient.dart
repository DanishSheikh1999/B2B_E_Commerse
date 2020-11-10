import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({@required this.onPressed, this.text, this.gradient,this.color,this.width_ratio=1.7});
  final GestureTapCallback onPressed;
  final List<Color> gradient;
  final Text text;
  final Color color;
  final double width_ratio;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      padding: const EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / width_ratio,
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color:color,
          gradient: gradient!=null ?LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight):null
        ),
        child: text,
        padding: EdgeInsets.only(top: 16, bottom: 16),
      ),
    );
  }
}
