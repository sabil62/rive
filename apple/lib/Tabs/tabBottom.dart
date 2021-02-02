import 'package:flutter/material.dart';

class TabBarBottom extends StatefulWidget {
  @override
  _TabBarBottomState createState() => _TabBarBottomState();
}

class _TabBarBottomState extends State<TabBarBottom> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation Bar"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.padding), label: "Padding"),
            BottomNavigationBarItem(
                icon: Icon(Icons.time_to_leave), label: "Car"),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome), label: "Awesome"),
          ],
        ),
        body: TabBarView(
          children: [
            Center(
              child: Icon(
                Icons.padding,
                size: 190,
                color: Colors.red,
              ),
            ),
            Center(
              child: Icon(
                Icons.padding,
                size: 190,
                color: Colors.red,
              ),
            ),
            Center(
              child: Icon(
                Icons.padding,
                size: 190,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
