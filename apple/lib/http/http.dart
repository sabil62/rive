import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpApp extends StatefulWidget {
  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  List data;
  Future getdata() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    http.Response response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
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
        title: Text("Http"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 1 : data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(data[index]["title"]),
          leading: Text(data[index]["id"].toString()),
          subtitle: Text(data[index]["completed"].toString()),
        ),
      ),
    );
  }
}
