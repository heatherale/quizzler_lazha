import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/ThemeCustom.dart';
import 'dart:math';

class CirclePainter extends CustomPainter{

  double _screenWidth;

  CirclePainter(this._screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = themeCustom.primaryColor
      ..style = PaintingStyle.fill;

    //canvas.drawArc(Rect.fromLTRB(0, 0, this.screenWidth, 300), pi, pi, false, painter);
    /*path.addOval(Rect.fromLTRB(0, 0, this.screenWidth, 300));
    canvas.drawPath(path, painter);*/

    const double _curveHeight = 35;

    var path = Path();
    path.lineTo(0, size.height-_curveHeight);
    path.relativeQuadraticBezierTo(this._screenWidth/2, 2*_curveHeight, this._screenWidth, 0);
    path.lineTo(this._screenWidth, 0);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(_) => false;
}