import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedFormField extends StatefulWidget {
  const RoundedFormField({
    Key key,
    @required this.textFormField,
    this.text,
    this.backgroundColor: Colors.white,
    this.borderRadius: 0,
    this.boxShadow,
    this.edgeInsets,
  }) : super(key: key);
  final double borderRadius;
  final BoxShadow boxShadow;
  final Color backgroundColor;
  final TextFormField textFormField;
  final Text text;


  final EdgeInsets edgeInsets;

  @override
  _RoundedFormFieldState createState() => _RoundedFormFieldState();
}

class _RoundedFormFieldState extends State<RoundedFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.text==null?Text(""):widget.text,
        SizedBox(height:10),
        Container(
            padding:
                widget.edgeInsets == null ? EdgeInsets.all(0) : widget.edgeInsets,
            decoration: BoxDecoration(
               color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                boxShadow: [
                  widget.boxShadow == null ? BoxShadow() : widget.boxShadow
                ]),
            child: widget.textFormField),
      ],
    );
  }
}
