import 'package:flutter/material.dart';

class BottomTabTwo extends StatefulWidget {
  @override
  _BottomTabTwoState createState() => _BottomTabTwoState();
}

class _BottomTabTwoState extends State<BottomTabTwo> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Bottom Navigation Bar"),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: 130,
              color: Colors.orange.withOpacity(0.22),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  indicatorColor: Colors.red,
                  labelColor: Colors.green[400],
                  unselectedLabelColor: Colors.brown[300],
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      child: Column(
                        children: [
                          Icon(
                            Icons.electric_moped_sharp,
                            size: 29,
                          ),
                          Text("lion")
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
            ),
          ),
          // : BottomNavigationBar(
          //   onTap: (index) {
          //     setState(() {
          //       indexer = index;
          //     });
          //   },
          //   currentIndex: indexer,
          //   selectedItemColor: Colors.blue[900],
          //   items: [
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.padding), label: "Padding"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.time_to_leave), label: "Car"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.auto_awesome), label: "Awesome"),
          //   ],
          // ),
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
            ],
          )),
    );
  }
}
