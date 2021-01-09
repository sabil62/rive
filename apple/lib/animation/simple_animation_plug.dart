import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SimpleAnimation extends StatefulWidget {
  @override
  _SimpleAnimationState createState() => _SimpleAnimationState();
}

class _SimpleAnimationState extends State<SimpleAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Stack(
              overflow: Overflow.visible,
              children: [boxanimation(), circleButton()],
            )
          ],
        ),
      ),
    );
  }

  Widget boxanimation() {
    return PlayAnimation(
      tween: Tween<double>(begin: 20.0, end: 280.0),
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
      delay: Duration(milliseconds: 0),
      builder: (context, child, anim) {
        return Container(
          height: anim,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0)),
              color: Colors.blue[200]),
        );
      },
    );
  }

  Widget circleButton() {
    return Positioned(
      top: 230,
      left: MediaQuery.of(context).size.width * 0.5 - 50,
      child: PlayAnimation(
        duration: Duration(milliseconds: 800),
        delay: Duration(milliseconds: 300),
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, child, animat) {
          return Transform.scale(
            scale: animat,
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red[200]),
              height: 100,
              width: 100,
            ),
          );
        },
      ),
    );
  }
}
