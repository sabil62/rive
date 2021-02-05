import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpComplex extends StatefulWidget {
  @override
  _HttpComplexState createState() => _HttpComplexState();
}

class _HttpComplexState extends State<HttpComplex> {
  List userdata;
  Map data;

  Future getdata() async {
    var url = "https://reqres.in/api/users?page=1";
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
        title: Text("Http complex"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300], width: 3),
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blue[100], Colors.blue[600]])),
              child: StreamBuilder(
                initialData: 0,
                stream: getstreamhttp(),
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          snapshot.data["id"].toString(),
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          snapshot.data["first_name"],
                          style: TextStyle(fontSize: 22),
                        ),
                        Text(snapshot.data["last_name"]),
                        Text(
                          snapshot.data["email"],
                          style: TextStyle(fontSize: 22),
                        ),
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data["avatar"]),
                        )
                      ],
                    ),
                  );
                  ;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Stream getstreamhttp() async* {
    for (var i = 0; i < userdata.length; i++) {
      await Future.delayed(Duration(milliseconds: 2150));
      yield userdata[i];
    }
  }
}
