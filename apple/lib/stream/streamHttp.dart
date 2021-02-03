import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StreamApp extends StatefulWidget {
  @override
  _StreamAppState createState() => _StreamAppState();
}

class _StreamAppState extends State<StreamApp> {
  Map data;
  List userdata;
  Future getdata() async {
    http.Response response =
        await http.get('https://reqres.in/api/users?page=1');
    data = json.decode(response.body);
    setState(() {
      userdata = data['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream')),
      backgroundColor: Color(0xff6DC8F3),
      body: StreamBuilder(
          initialData: 'Waiting',
          stream: streamData(),
          builder: (context, snapshot) {
            return Center(
              child: Text(
                snapshot.data,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
              ),
            );
          }),
    );
  }

//  List datas = ['apple', 'ball', 'cat', 'dog', 'fire'];

  Stream streamData() async* {
    for (var i = 0; i < userdata.length; i++) {
      await Future.delayed(Duration(milliseconds: 1000));
      yield userdata[i]["first_name"];
    }
  }
}
