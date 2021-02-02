import 'package:flutter/material.dart';

class TabBarBottom extends StatefulWidget {
  @override
  _TabBarBottomState createState() => _TabBarBottomState();
}

class _TabBarBottomState extends State<TabBarBottom> {
  int indexer = 0;
  List<Widget> widgets = [
    Center(
      child: Icon(
        Icons.padding,
        size: 190,
        color: Colors.red,
      ),
    ),
    Center(
      child: Icon(
        Icons.time_to_leave,
        size: 190,
        color: Colors.green[400],
      ),
    ),
    Center(
      child: Icon(
        Icons.auto_awesome,
        size: 190,
        color: Colors.blue[400],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bottom Navigation Bar"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              indexer = index;
            });
          },
          currentIndex: indexer,
          selectedItemColor: Colors.blue[900],
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.padding), label: "Padding"),
            BottomNavigationBarItem(
                icon: Icon(Icons.time_to_leave), label: "Car"),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_awesome), label: "Awesome"),
          ],
        ),
        body: widgets.elementAt(indexer));
  }
}
