import 'package:flutter/material.dart';

class InBuildAnimation extends StatefulWidget {
  @override
  _InBuildAnimationState createState() => _InBuildAnimationState();
}

class _InBuildAnimationState extends State<InBuildAnimation> {
  double height = 80;
  double width = 80;
  double radius = 5;
  double distance = 40;
  bool first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 36, 8, 8),
        child: ListView(
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1400),
                  curve: Curves.easeInCubic,
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Colors.red),
                ),
              ],
            ),
            Text("For size"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      height = height + 20;
                      width = width + 20;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    this.setState(() {
                      height = height - 20;
                      width = width - 20;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                )
              ],
            ),
            Text("For radius"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      radius = radius + 34;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    this.setState(() {
                      radius = radius - 24;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.remove,
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  height: 170,
                  width: 370,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        child: Icon(
                          Icons.train,
                          color: Colors.pink,
                          size: 150,
                        ),
                        duration: Duration(milliseconds: 1300),
                        left: distance,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  distance = distance < 350 ? distance + 50 : 50;
                });
              },
              child: Text("Tap for movement of vechile"),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCrossFade(
                  crossFadeState: first
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1100),
                  firstChild: Container(
                    child: Icon(
                      Icons.access_alarms_sharp,
                      size: 120,
                    ),
                  ),
                  secondChild: Container(
                    child: Icon(
                      Icons.dialer_sip,
                      size: 120,
                    ),
                  ),
                ),
              ],
            ),
            RaisedButton(
              onPressed: () {
                this.setState(() {
                  first = !first;
                });
              },
              child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("Tap to CrossFade Icon")),
            )
          ],
        ),
      ),
    );
  }
}

// class InBuildAnimations extends StatelessWidget {
//   Lion lion = Lion();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("In Build Animations"),
//       ),
//       body: lion,
//     );
//   }
// }

// class Lion extends StatefulWidget {
//   @override
//   _LionState createState() => _LionState();
// }

// class _LionState extends State<Lion> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
