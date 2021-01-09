import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

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
              children: [
                boxanimation(),
                rectTransform(),
                rectRotate(),
                circleButton()
              ],
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

  Widget rectTransform() {
    return Positioned(
      top: 10,
      left: 10,
      child: PlayAnimation(
        tween: Tween(begin: Offset(0, 0), end: Offset(160, 160)),
        duration: Duration(milliseconds: 1000),
        builder: (context, child, anims) {
          return Transform.translate(
            offset: anims,
            child: Container(
              height: 40,
              width: 150,
              color: Colors.yellow,
            ),
          );
        },
      ),
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

  Widget rectRotate() {
    return Positioned(
      top: 30,
      right: 30,
      child: PlayAnimation(
        tween: Tween(begin: math.pi, end: math.pi * 4),
        duration: Duration(milliseconds: 2400),
        builder: (context, child, anims) {
          return Transform.rotate(
            angle: anims,
            child: Container(
              height: 30,
              width: 130,
              color: Colors.brown[200],
            ),
          );
        },
      ),
    );
  }
}
