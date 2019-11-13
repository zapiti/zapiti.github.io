import 'package:flutter/material.dart';

class HalfCircle extends CustomPainter{

  final Color _color;
  double radius;
  HalfCircle(this._color,{this.radius = 360});
  @override
  void paint(Canvas canvas, Size size) {

    canvas.drawArc(Rect.fromCircle(center:Offset(-1,size.height/2),radius: radius), 4.7175, 3.14, false, customPaint());
  }


  Paint customPaint(){
    Paint paint = Paint();
    paint.color = _color;
    paint.isAntiAlias = true;
    paint.strokeWidth = 10;
    return paint;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}