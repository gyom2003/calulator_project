import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override 
  Path getClip(Size size) {
    //création clipper
    var path = Path();
    path.lineTo(0, size.height - 10); 
    //curves avant de revenir et close()
    path.quadraticBezierTo(size.width / 4, size.height - 65, size.width / 2, size.height - 40); 
    path.quadraticBezierTo(3 / 4 * size.width, size.height, size.width, size.height - 40); 
    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    //implémenter le clipper
    return true;
  }
}


class CircularClipper extends CustomClipper <Path> {
  //CustomClipper est le clipper de ClipPath 
  @override 
  //création clipper 
  Path getClip(Size size) {
    var path = Path(); 
    path.lineTo(0.0, size.height - 70); 
     path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }  
  @override 
  bool shouldReclip (CustomClipper <Path> oldClipper) {
    return true; 
  }
}

//classe qui permet de faire passer CircularClipper clipper avec les paramètres shadow et child
//return CustomClipShadowPaint qui établit le shadow du clipper donné par CustomClipShadow
class CustomClipShadow extends StatelessWidget {
  //constructeur
  final Shadow shadow; 
  final CustomClipper<Path> clipper; 
  final Widget child; 
  CustomClipShadow({
    @required this.shadow, 
    @required this.clipper, 
    @required this.child, 
  }); 
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomClipShadowPaint(
        clipper: this.clipper, 
        shadow: this.shadow 
      ), 
      child: ClipPath(
        child: child, 
        clipper: this.clipper,
      )
    );
  }
}

class CustomClipShadowPaint extends CustomPainter {
  //constructeur
  final Shadow shadow; 
  final CustomClipper<Path> clipper; 
  CustomClipShadowPaint({
    this.shadow, 
    this.clipper, 
  }); 
  @override 
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override 
  bool shouldRepaint (CustomPainter oldDelegate) {
    return true;
  }
}