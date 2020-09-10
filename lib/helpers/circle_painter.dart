import 'package:flutter/material.dart';
import 'package:quizzler/view/shared/theme_custom.dart';

class CirclePainter extends CustomPainter{

  double _screenWidth;

  CirclePainter(this._screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = themeCustom.primaryColor
      ..style = PaintingStyle.fill;


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