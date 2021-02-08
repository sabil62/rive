import 'package:flutter/material.dart';

class ClipTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clipper Two"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 8),
        child: ListView(
          children: [
            ClipPath(
              clipper: Customer(),
              child: Container(
                height: 250,
                width: 540,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(3, 3),
                          blurRadius: 10)
                    ],
                    gradient: LinearGradient(
                        colors: [Colors.red[100], Colors.red[600]],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ClipPath(
              clipper: Human(),
              child: containerWidget(
                  250.0, 540.0, Colors.pink[100], Colors.pink[600]),
            )
          ],
        ),
      ),
    );
  }

  Container containerWidget(height, width, Color color1, Color color2) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(3, 3),
                blurRadius: 10)
          ],
          border: Border.all(width: 1),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [color1, color2])),
    );
  }
}

class Human extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    //left face
    path.moveTo(size.width * 0.48, 0);
    path.quadraticBezierTo(size.width * 0.3, 45, size.width * 0.4, 90);
    //left neck
    path.lineTo(size.width * 0.4, 100);
    //left hand
    path.lineTo(size.width * 0.2, 40);
    path.quadraticBezierTo(size.width * 0.1, 55, size.width * 0.2, 80);
    path.lineTo(size.width * 0.2, 80);
    path.lineTo(size.width * 0.4, 140);
    //left leg
    path.lineTo(size.width * 0.4, 160);
    path.lineTo(size.width * 0.25, 200);
    path.quadraticBezierTo(size.width * 0.15, 220, size.width * 0.25, 240);
    path.lineTo(size.width * 0.4, 200);
    //box
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class Customer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.moveTo(size.width * 0.48, 0);
    path.quadraticBezierTo(
        size.width * 0.3, 40, size.width * 0.4, 80); //upto neck
    //jjust rectangle
    path.lineTo(size.width * 0.4, size.height);
    path.lineTo(size.width * 0.6, size.height);
    path.lineTo(size.width * 0.6, 80);
    //upto here
    path.quadraticBezierTo(size.width * 0.7, 40, size.width * 0.52, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
