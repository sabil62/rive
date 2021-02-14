import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceTwo extends StatefulWidget {
  @override
  _SharedPreferenceTwoState createState() => _SharedPreferenceTwoState();
}

class _SharedPreferenceTwoState extends State<SharedPreferenceTwo> {
  String name = "";
  String email = "";
  Future setPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("shareName", "Lion Bhai is shared");
    prefs.setString("shareEmail", "LionBhai@gmail.com");
    //not needed
    print("initstate here for setpreference");
  }

  Future getPreferenceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("shareName");
      email = prefs.getString("shareEmail");
    });
  }

  @override
  void initState() {
    super.initState();
    setPreferenceData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Two"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name + " :this is name",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          Text(
            email + " :this is email",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
            child: Text("Press to get email and name"),
            onPressed: () async {
              getPreferenceData();
            },
          )
        ],
      ),
    );
  }
}
