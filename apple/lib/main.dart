import 'package:apple/animation/animation_simple.dart';
import 'package:apple/animation/simple_animation_plug.dart';
import 'package:apple/http/http.dart';
import 'package:apple/http/httpComplex.dart';
import 'package:apple/provider%20complex/playersProvider.dart';
import 'package:apple/provider/counterProvider.dart';
import 'package:apple/repeat/provider/counterProvider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click on drawer',
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 0, 0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'first',
              onPressed: null,
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: null,
              heroTag: 'second',
              child: Icon(Icons.remove, size: 37, color: Colors.red),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 36,
            ),
            ListTile(
              leading: Icon(
                Icons.ac_unit,
                size: 34,
                color: Colors.red,
              ),
              title: Text('Provider Simple'),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => CounterProvider())),
            ),
            ListTile(
              leading: Icon(
                Icons.remove_circle_outline_sharp,
                size: 34,
                color: Colors.orange,
              ),
              title: Text('Provider Complex'),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => PlayersProvider())),
            ),
            ListTile(
              leading: Icon(
                Icons.cached,
                size: 34,
                color: Colors.brown,
              ),
              title: Text('Animations Simple'),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => AnimationSimple())),
            ),
            ListTile(
              leading: Icon(
                Icons.ramen_dining,
                size: 34,
                color: Colors.yellow,
              ),
              title: Text('Simple Animations'),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => SimpleAnimation())),
            ),
            Divider(
              height: 2,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.zoom_in_rounded,
                size: 34,
                color: Colors.green,
              ),
              title: Text('Counter Provider Repeat'),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => CounterProviders())),
            ),
            Divider(
              color: Colors.black,
              height: 2,
            ),
            ListTile(
              leading: Icon(
                Icons.no_cell,
                size: 34,
                color: Colors.yellow,
              ),
              title: Text('Http simple'),
              onTap: () => Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => HttpApp())),
            ),
            ListTile(
              leading: Icon(
                Icons.arrow_left,
                size: 34,
                color: Colors.red,
              ),
              title: Text('Http Complex'),
              onTap: () => Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => HttpComplexApp())),
            ),
          ],
        ),
      ),
    );
  }
}
