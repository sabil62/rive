import 'package:flutter/material.dart';

class ClipPathApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clippers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            yellow200(),
            SizedBox(
              height: 25,
            ),
            ClipPath(clipper: Clipers(), child: yellow200()),
            SizedBox(
              height: 25,
            ),
            ClipPath(
              clipper: SimpleClipper(),
              child: yellow200(),
            )
          ],
        ),
      ),
    );
  }

  Container yellow200() {
    return Container(
      height: 200,
      width: 600,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(3, 3),
                blurRadius: 10)
          ],
          border: Border.all(width: 3, color: Colors.grey[300]),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.yellow[100], Colors.yellow[600]])),
    );
  }
}

class Clipers extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.moveTo(100, 100);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width * 0.8, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class SimpleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(0, size.height, size.width * 0.4, size.height);
    path.lineTo(size.width * 0.6, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height * 0.6);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
