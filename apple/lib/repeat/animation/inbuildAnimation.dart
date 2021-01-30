import 'package:flutter/material.dart';

class InBuildAnimation extends StatefulWidget {
  @override
  _InBuildAnimationState createState() => _InBuildAnimationState();
}

class _InBuildAnimationState extends State<InBuildAnimation> {
  double height = 80;
  double width = 80;
  double radius = 5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1400),
            curve: Curves.bounceIn,
            height: height,
            width: width,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(radius)),
          ),
          Text("For size"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    height = height + 10;
                    width = width + 10;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add,
                    size: 36,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  this.setState(() {
                    height = height - 10;
                    width = width - 10;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.remove,
                    size: 36,
                  ),
                ),
              )
            ],
          ),
          Text("For radius"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    radius = radius + 24;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add,
                    size: 36,
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
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add,
                    size: 36,
                  ),
                ),
              )
            ],
          )
        ],
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
