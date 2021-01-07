import 'package:flutter/material.dart';

class AnimationSimple extends StatefulWidget {
  @override
  _AnimationSimpleState createState() => _AnimationSimpleState();
}

class _AnimationSimpleState extends State<AnimationSimple> {
  bool tappedAnimatedCross = false;
  double height = 150;
  double width = 150;
  double radii = 20;
  double leftGo = 10;

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
              style: font(32.0),
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
                  //curve: null,
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
                      )),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      height = height > 400 ? 150 : height + 100;
                      width = width > 400 ? 150 : width + 100;
                      radii = radii > 350 ? 20 : radii + 120;
                    });
                  },
                  child: Text('Tap to change container'),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Animated Position',
              style: font(30.0),
            ),
            Container(
              height: 250,
              child: Stack(
                //container or other widget should cover stack to define HEIGHT
                children: [
                  AnimatedPositioned(
                    child: Icon(
                      Icons.train,
                      size: 230,
                      color: Colors.red[400],
                    ),
                    duration: Duration(milliseconds: 1600),
                    right: leftGo,
                  ),
                ],
              ),
            ),
            RaisedButton(
                child: Text('Click here to move icon'),
                onPressed: () {
                  setState(() {
                    leftGo = leftGo > 300 ? 0 : leftGo + 100;
                  });
                }),
            Text(
              'Animated Crossfade',
              style: font(30.0),
            ),
            AnimatedCrossFade(
                crossFadeState: tappedAnimatedCross
                    ? CrossFadeState.showSecond //bcoz tapped is false initially
                    : CrossFadeState.showFirst,
                firstChild: Icon(
                  Icons.electric_bike,
                  size: 64,
                  color: Colors.red[300],
                ),
                secondChild: Icon(
                  Icons.rice_bowl_sharp,
                  size: 68,
                  color: Colors.blue[400],
                ),
                duration: Duration(milliseconds: 1600)),
            RaisedButton(
              onPressed: () => tappedAnimatedCross != tappedAnimatedCross,
              child: Text('Press here to change up ICON'),
            )
          ],
        ),
      ),
    );
  }

  TextStyle font(size, {weight = FontWeight.w600}) {
    return TextStyle(fontSize: size, fontWeight: weight);
  }
}
