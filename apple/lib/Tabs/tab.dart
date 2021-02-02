import 'package:flutter/material.dart';

class TabBarApp extends StatefulWidget {
  @override
  _TabBarAppState createState() => _TabBarAppState();
}

class _TabBarAppState extends State<TabBarApp> {
  Color primaryColor = Colors.blue[300];
  Color tabBarColor = Colors.red[500];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text("Tabs"),
          elevation: 6,
          shadowColor: Colors.blueAccent[600],
          toolbarHeight: 194,
          // shape: ShapeBorder(shap),
          bottom: TabBar(
            unselectedLabelColor: Colors.pink[100],
            indicatorColor: tabBarColor,
            indicatorWeight: 5,
            labelColor: tabBarColor,
            onTap: (index) {
              setState(() {
                switch (index) {
                  case 1:
                    primaryColor = Colors.red[300];
                    tabBarColor = Colors.blue[500];
                    break;
                  case 2:
                    primaryColor = Colors.green[300];
                    tabBarColor = Colors.yellow[400];

                    break;
                  default:
                    primaryColor = Colors.blue[300];
                    tabBarColor = Colors.red[500];
                }
              });
            },
            tabs: [
              //instead of icon used child
              Tab(
                child: Column(
                  children: [
                    Icon(
                      Icons.electric_moped_sharp,
                      size: 37,
                    ),
                    Text("Scooter"),
                  ],
                ),
              ),
              Tab(
                  child: Column(
                children: [Icon(Icons.sanitizer, size: 37)],
              )),
              Tab(
                  child: Column(
                children: [Icon(Icons.read_more, size: 37)],
              ))
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
