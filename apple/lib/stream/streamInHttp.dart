import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStream extends StatefulWidget {
  @override
  _HttpStreamState createState() => _HttpStreamState();
}

class _HttpStreamState extends State<HttpStream> {
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
        title: Text('Stream from Http'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 180,
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: StreamBuilder(
                initialData: 0,
                stream: streamHttp(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        snapshot.data["id"].toString(),
                        style: TextStyle(fontSize: 32),
                      ),
                      Text(
                        snapshot.data["title"],
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        snapshot.data["completed"].toString(),
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Stream streamHttp() async* {
    for (var i = 0; i < data.length; i++) {
      await Future.delayed(Duration(milliseconds: 1300));
      yield data[i];
    }
  }
}
