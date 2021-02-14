import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  List data;
  List<People> people = List<People>();
  List<People> peopleActualDisplay = List<People>();
  Future getdata() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
    });
    var peoples = List<People>();
    for (var u in data) {
      peoples.add(People.fromJson(u));
    }
    return peoples;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata()
        .then((datas) => {people.addAll(datas), peopleActualDisplay = people});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: peopleActualDisplay.length + 1,
        itemBuilder: (context, index) {
          return index == 0
              ? searchBar()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(peopleActualDisplay[index - 1].name),
                        Text(peopleActualDisplay[index - 1].email)
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.purple[100], Colors.purple[600]])),
                  ),
                );
        },
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: "Enter the query",
          hintText: "Enter the query",
          hintStyle:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[300]),
          labelStyle:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[700]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(width: 10, color: Colors.blue[200])),
          focusColor: Colors.green[200],
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[800])),
        ),
        onChanged: (valueWritten) {
          valueWritten = valueWritten.toLowerCase();
          setState(() {
            peopleActualDisplay = people.where((value) {
              return (value.name.toLowerCase().contains(valueWritten) ||
                  value.email.toLowerCase().contains(valueWritten));
            }).toList();
          });
        },
      ),
    );
  }
}

class People {
  String name;
  String email;
  People(this.name, this.email);
  People.fromJson(Map json)
      : name = json["name"],
        email = json["email"];
}
