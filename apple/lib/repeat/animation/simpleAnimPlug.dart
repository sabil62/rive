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
      body: ListView(
        children: [
          Container(
            height: 400,
            child: Stack(
              overflow: Overflow.visible, //for the circle in between
              children: [
                topBox(),
                doubleStackedPlayAnimation(),
                circleMiddle(),
                bounceAnimatedPosition()
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          bigBox(),
          SizedBox(
            height: 36,
          ),
          turn(),
        ],
      ),
    );
  }

  Widget topBox() {
    return Positioned(
      top: 0,
      child: PlayAnimation(
        tween: Tween<double>(begin: 0, end: 400),
        duration: Duration(milliseconds: 1600),
        curve: Curves.easeInOut,
        builder: (context, child, height) {
          return Container(
            height: height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.23),
                      offset: Offset(0, 4),
                      blurRadius: 10)
                ],
                gradient: LinearGradient(
                    colors: [Colors.pink[100], Colors.pink[100]])),
          );
        },
      ),
    );
  }

  Widget doubleStackedPlayAnimation() {
    return Positioned(
      top: 100,
      left: 10,
      child: PlayAnimation(
        tween: Tween<double>(begin: 0, end: 150),
        delay: Duration(milliseconds: 400),
        duration: Duration(milliseconds: 1200),
        curve: Curves.bounceOut,
        builder: (context, child, height) {
          return PlayAnimation(
            delay: Duration(milliseconds: 400),
            duration: Duration(milliseconds: 1600),
            curve: Curves.bounceOut,
            tween: Tween<double>(begin: 0, end: 300),
            builder: (context, child, width) {
              return PlayAnimation(
                tween: Tween<double>(begin: 0, end: 130),
                curve: Curves.ease,
                builder: (context, child, radius) {
                  return Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: Colors.green[width < 250 ? 100 : 500]),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget circleMiddle() {
    return Positioned(
      top: 350,
      left: MediaQuery.of(context).size.width * 0.4,
      child: PlayAnimation(
        delay: Duration(milliseconds: 900),
        duration: Duration(
          milliseconds: 900,
        ),
        tween: Tween<double>(begin: 0, end: 100),
        builder: (context, child, val) {
          return Container(
            height: val,
            width: val,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red[800],
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.22),
                      offset: Offset(2, 2),
                      blurRadius: 8)
                ]),
          );
        },
      ),
    );
  }

  Widget bounceAnimatedPosition() {
    return Positioned(
      top: 0,
      left: 40,
      child: PlayAnimation(
        delay: Duration(milliseconds: 200),
        duration: Duration(milliseconds: 3200),
        tween: Tween<double>(begin: 0, end: 280),
        curve: Curves.bounceInOut,
        builder: (context, child, bouncer) {
          return Container(
            height: 400,
            width: 330,
            child: Stack(
              overflow: Overflow.visible,
              children: [
                //This should be commented
                // AnimatedPositioned(
                //   top: bouncer,
                //   left: bouncer / 10,
                //   duration: null,
                //   child: Container(
                //     height: 50,
                //     width: 50,
                //     decoration: BoxDecoration(
                //         color: Colors.orange,
                //         shape: BoxShape.circle,
                //         boxShadow: [
                //           BoxShadow(
                //               offset: Offset(2, 2),
                //               blurRadius: 10,
                //               color: Colors.black.withOpacity(0.22))
                //         ]),
                //   ),
                // ),
                //The above should be commented
                Positioned(
                  top: bouncer,
                  left: 250,
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Text("bounceAnimatedPosition"),
                    decoration: BoxDecoration(
                        color: Colors.brown[400],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.22))
                        ]),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bigBox() {
    return PlayAnimation<double>(
      duration: Duration(milliseconds: 1300),
      tween: (0.0).tweenTo(200.0),
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
