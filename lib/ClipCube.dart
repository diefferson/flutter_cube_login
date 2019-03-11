import 'package:flutter/material.dart';

class ClipCube extends CustomClipper<Path>{

  final bool fromLeft;
  final double height;


  ClipCube({@required this.fromLeft, @required this.height});

  @override
  Path getClip(Size size) {
    if(fromLeft){
      return Path()
        ..moveTo(0.0, height)
        ..lineTo(0.0, size.height-height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, 0.0)
        ..close();
    }else{
      return Path()
        ..lineTo(0.0, 0.0)
        ..lineTo(0.0, size.height)
        ..lineTo(size.width, size.height-height)
        ..lineTo(size.width, 0.0+height)
        ..close();
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper!= this;
  }
}