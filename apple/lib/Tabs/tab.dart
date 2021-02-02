import 'package:flutter/material.dart';

class TabBarApp extends StatefulWidget {
  @override
  _TabBarAppState createState() => _TabBarAppState();
}

class _TabBarAppState extends State<TabBarApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabs"),
          elevation: 6,
          shadowColor: Colors.blueAccent[900].withOpacity(0.4),
          toolbarHeight: 134,
          // shape: ShapeBorder(shap),
          bottom: TabBar(
            tabs: [
              //instead of icon used child
              Tab(
                child: Icon(
                  Icons.electric_moped_sharp,
                  size: 37,
                ),
              ),
              Tab(child: Icon(Icons.sanitizer, size: 37)),
              Tab(child: Icon(Icons.read_more, size: 37))
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(items: [],),
        body: TabBarView(children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  Text("First Tab"),
                  Icon(Icons.receipt_long_outlined, size: 150)
                ],
              ),
              decoration: BoxDecoration(
                  // backgroundBlendMode: Bablenmo
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        spreadRadius: 10),
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        spreadRadius: -10)
                  ]),
            ),
          ),
          Center(
            child: Container(
              child: Column(
                children: [
                  Text("Second Tab"),
                  Icon(Icons.receipt_long_outlined, size: 150)
                ],
              ),
              decoration: BoxDecoration(
                  // backgroundBlendMode: Bablenmo
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        spreadRadius: 10),
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        spreadRadius: -10)
                  ]),
            ),
          ),
          Center(
            child: Container(
              child: Column(
                children: [
                  Text("Third Tab"),
                  Icon(Icons.receipt_long_outlined, size: 150)
                ],
              ),
              decoration: BoxDecoration(
                  // backgroundBlendMode: Bablenmo
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        spreadRadius: 10),
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 2),
                        spreadRadius: -10)
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
