import 'package:flutter/material.dart';

class TransitionSecond extends StatefulWidget {
  @override
  _TransitionSecondState createState() => _TransitionSecondState();
}

class _TransitionSecondState extends State<TransitionSecond>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<Offset> _animationOffset;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2700))
          ..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _animationOffset = Tween<Offset>(begin: Offset.zero, end: Offset(0.4, 0))
        .animate(CurvedAnimation(curve: Curves.bounceOut, parent: _controller));
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
        title: Text("Transition Offset"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SlideTransition(
              position: _animationOffset,
              child: decorations(),
            ),
            Divider(
              color: Colors.black,
              thickness: 4,
            ),
            SizeTransition(
              sizeFactor: _animation,
              child: decorations(),
            ),
            Divider(
              color: Colors.black,
              thickness: 3,
            ),
            RotationTransition(
              turns: _animation,
              child: Align(
                child: Container(
                  height: 200,
                  width: 100,
                  color: Colors.blue[200],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget decorations() {
    return Container(
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: Colors.grey[200], width: 2),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.orange[100], Colors.pink[600]])),
    );
  }
}
