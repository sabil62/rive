import 'package:flutter/material.dart';

class TransitionAnimation extends StatefulWidget {
  @override
  _TransitionAnimationState createState() => _TransitionAnimationState();
}

class _TransitionAnimationState extends State<TransitionAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 2700), vsync: this)
          ..repeat(reverse: true);
    _animation = CurvedAnimation(curve: Curves.easeInOut, parent: _controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Transitions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizeTransition(
              sizeFactor: _animation,
              child: Container(
                height: 200,
                child: Image.asset("asset/geography.png"),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.red[200]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
