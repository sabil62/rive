import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedThree extends StatefulWidget {
  @override
  _SharedThreeState createState() => _SharedThreeState();
}

class _SharedThreeState extends State<SharedThree> {
  String tname = "";
  String temail = "";
  bool valueSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared PREFERENCE func inside"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString("tname", "THIS IS THE TNAME");
              prefs.setString("temail", "PPLIONB@PPMAIL.COM");
              //Extra thing no need actually
              setState(() {
                valueSet = true;
                // valueSet = !valueSet;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "SET THE NAMES",
                style: texter(),
              ),
            ),
            color: Colors.blue[400],
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
          ),
          valueSet ? Text(tname + "___" + temail) : Text("Not set yet!"),
          RaisedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                tname = prefs.getString("tname");
                temail = prefs.getString("temail");
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "GET THE NAMES",
                style: texter(),
              ),
            ),
            color: Colors.blue[400],
          ),
          Divider(
            color: Colors.black,
            thickness: 4,
            height: 30,
          ),
          //---------------------------------Not needed this(just to see whether you can get sharedPre data from other page)
          RaisedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              //as this is already in void initstate
              String sharedPreferenceTwoEmail = "";
              String two, three;
              two = prefs.getString("name");
              three = prefs.getString("email");
              sharedPreferenceTwoEmail = prefs.getString("shareEmail");
              print(sharedPreferenceTwoEmail + "is the email");
              print("others");
              print(two + "____" + three);
            },
            child: Text("Get from others see console"),
          )
        ],
      ),
    );
  }

  TextStyle texter() {
    return TextStyle(
        fontSize: 28, fontWeight: FontWeight.bold, color: Colors.amber[100]);
  }
}
