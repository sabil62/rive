import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleSharedPrefernces extends StatefulWidget {
  @override
  _SimpleSharedPreferncesState createState() => _SimpleSharedPreferncesState();
}

class _SimpleSharedPreferncesState extends State<SimpleSharedPrefernces> {
  String name;
  String email;
  Future setPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", "lions");
    prefs.setString("email", "lion@gmail.com");
    print("Data saved");
  }

  Future getPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String one, two;
    one = prefs.getString("name");
    two = prefs.getString("email");
    print("the name is" + one);
    print("the email is" + two);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefernce"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Please See in Console",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
          ),
          RaisedButton(
            color: Colors.red[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("setValue"),
            ),
            onPressed: () async {
              setPreference();
            },
          ),
          RaisedButton(
            color: Colors.blue[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Get Data"),
            ),
            onPressed: () async {
              getPreference();
            },
          )
        ],
      ),
    );
  }
}
