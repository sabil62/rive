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
              clipper: Human(),
              child: containerWidget(
                  250.0, 540.0, Colors.grey[100], Colors.grey[600]),
            ),
            SizedBox(
              height: 30,
            ),
            ClipPath(
              clipper: Human(),
              child: containerWidget(
                  250.0, 540.0, Colors.pink[100], Colors.pink[600]),
            ),
            SizedBox(
              height: 22,
            ),
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
    path.moveTo(size.width * 0.48, 3);
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
    //between
    path.lineTo(size.width * 0.5, 173);
    // path.lineTo(size.width * 0.6, 200);
    //Right leg
    path.lineTo(size.width * 0.8, 240);
    path.quadraticBezierTo(size.width * 0.85, 220, size.width * 0.8, 205);
    path.lineTo(size.width * 0.8, 205);
    //KAMAR
    path.lineTo(size.width * 0.6, 160);

    path.lineTo(size.width * 0.6, 140);
    //right hand
    path.lineTo(size.width * 0.9, 140);
    path.quadraticBezierTo(size.width * 0.95, 120, size.width * 0.9, 100);
    path.lineTo(size.width * 0.9, 100);
    path.lineTo(size.width * 0.6, 100);
    //neck
    path.lineTo(size.width * 0.6, 90);
    //head
    path.quadraticBezierTo(size.width * 0.7, 45, size.width * 0.52, 3);

    //    path.moveTo(size.width * 0.48, 0);
    // path.quadraticBezierTo(size.width * 0.3, 45, size.width * 0.4, 90);

    path.quadraticBezierTo(size.width * 0.5, 0, size.width * 0.48, 0);

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
    path.moveTo(size.width * 0.48, 5);
    path.quadraticBezierTo(
        size.width * 0.3, 40, size.width * 0.4, 80); //upto neck
    //jjust rectangle
    path.lineTo(size.width * 0.05, size.height);
    path.lineTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width * 0.95, size.height);
    path.lineTo(size.width * 0.6, 80);
    //upto here
    path.quadraticBezierTo(size.width * 0.7, 40, size.width * 0.52, 5);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width * 0.48, 5);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
