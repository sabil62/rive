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
  void dispose() {
    super.dispose();
    _controller.dispose();
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
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Colors.black,
            ),
            ScaleTransition(
              scale: _animation,
              child: containers(),
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Colors.black,
            ),
            FadeTransition(
              opacity: _animation,
              child: containers(),
            ),
            Divider(
              color: Colors.black,
            ),
            RotationTransition(
              turns: _animation,
              child: containers(),
            )
          ],
        ),
      ),
    );
  }

  Widget containers() {
    return Container(
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.grey[200], width: 2),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pink[100], Colors.pink[600]])),
    );
  }
}
