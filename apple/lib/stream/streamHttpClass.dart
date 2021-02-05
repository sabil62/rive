import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamHTTPwithClass extends StatefulWidget {
  @override
  _StreamHTTPwithClassState createState() => _StreamHTTPwithClassState();
}

class _StreamHTTPwithClassState extends State<StreamHTTPwithClass> {
  List<Bussiness> bussiness;
  List data;
  Future getdata() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
    });
    List<Bussiness> buss;
    for (var u in data) {
      buss.add(Bussiness.fromJson(u));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata().then((value) {
      bussiness.addAll(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Http from Class"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green[100], Colors.green[700]],
                  ),
                  border: Border.all(
                      color: Colors.black45,
                      width: 3,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(14)),
              child: StreamBuilder(
                initialData: 0,
                stream: getstreamFromClass(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data.id.toString(),
                        style: TextStyle(fontSize: 32),
                      ), // no need for snapshot.data["id"].toString()
                      Text(
                        snapshot.data.name,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        snapshot.data.username,
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        snapshot.data.email,
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Stream getstreamFromClass() async* {
    for (var i = 0; i < bussiness.length; i++) {
      await Future.delayed(Duration(milliseconds: 1200));
      yield bussiness[i];
    }
  }
}

class Bussiness {
  int id;
  String name;
  String username;
  String email;
  Bussiness(this.id, this.name, this.username, this.email);
  Bussiness.fromJson(Map json)
      : id = json["id"],
        name = json["name"],
        username = json["username"],
        email = json["email"];
}
