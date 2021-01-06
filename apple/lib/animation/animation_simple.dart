import 'package:flutter/material.dart';

class AnimationSimple extends StatefulWidget {
  @override
  _AnimationSimpleState createState() => _AnimationSimpleState();
}

class _AnimationSimpleState extends State<AnimationSimple> {
  bool cc = false;
  double height = 300;
  double width = 300;
  double radii = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              'Animated Container',
              style: font(32, weight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1600),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radii),
                      gradient: LinearGradient(
                          colors: [
                            Colors.green[100],
                            Colors.green[500],
                            Colors.black.withOpacity(0.7)
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [null])),
                ),
                RaisedButton(
                  onPressed: () {
                    height = height > 500 ? 200 : height + 100;
                    width = width > 500 ? 200 : width + 100;
                    radii = radii > 250 ? 20 : radii + 120;
                  },
                  child: Text('Tap to change container'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle font(size, {weight = FontWeight.w600}) {
    return TextStyle(fontSize: size, fontWeight: weight);
  }
}
