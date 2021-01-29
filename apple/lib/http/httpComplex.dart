import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpComplexApp extends StatefulWidget {
  @override
  _HttpComplexAppState createState() => _HttpComplexAppState();
}

class _HttpComplexAppState extends State<HttpComplexApp> {
  List userdata;
  Map data;
  Future getdata() async {
    var url = "https://reqres.in/api/users?page=2";
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    setState(() {
      userdata = data["data"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Complex"),
      ),
      body: ListView.builder(
        itemCount: userdata == null ? 0 : userdata.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userdata[index]["avatar"]),
            ),
            title: Text(userdata[index]["first_name"]),
          );
        },
      ),
    );
  }
}
