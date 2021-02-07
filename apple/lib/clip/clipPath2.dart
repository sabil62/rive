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
            )
          ],
        ),
      ),
    );
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
