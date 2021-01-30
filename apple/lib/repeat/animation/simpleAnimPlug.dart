import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'dart:math' as math;

class SimpleAnim extends StatefulWidget {
  @override
  _SimpleAnimState createState() => _SimpleAnimState();
}

class _SimpleAnimState extends State<SimpleAnim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          bigBox(),
          SizedBox(
            height: 36,
          ),
          turn()
        ],
      ),
    );
  }

  Widget bigBox() {
    return PlayAnimation<double>(
      duration: Duration(milliseconds: 1300),
      tween: (0.0).tweenTo(400.0),
      curve: Curves.ease,
      builder: (context, child, height) => Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Text("This is big box"),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [Colors.blue[300], Colors.black26],
              begin: Alignment.center,
            )),
      ),
    );
  }

  Widget turn() {
    return PlayAnimation(
      tween: (math.pi).tweenTo(math.pi * 4),
      duration: Duration(milliseconds: 5000),
      delay: Duration(milliseconds: 1200),
      builder: (context, child, values) => Transform.rotate(
        angle: values,
        child: Container(
          height: 55,
          width: 278,
          color: Colors.pink[100],
        ),
      ),
    );
  }
}
