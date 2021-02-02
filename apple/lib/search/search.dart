import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//employe class
class Employee {
  String name;
  String email;
  Employee(this.name, this.email);
  Employee.fromJson(Map json)
      : name = json["name"],
        email = json["email"];
}

class SearchApp extends StatefulWidget {
  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  List data;
  List<Employee> employeeCopy = List<Employee>();
  List<Employee> emplpoyeeDisplayInSearch = List<Employee>();
  Future getdata() async {
    var url = "http://jsonplaceholder.typicode.com/posts/1/comments";
    http.Response response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
    });
    var employees;
    //---------------Check this
    for (var u in data) {
      employees.add(data[u]);
    }
    return employees;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata().then((data) =>
        {employeeCopy.addAll(data), emplpoyeeDisplayInSearch = employeeCopy});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBar'),
      ),
      body: ListView(
        children: [Text("Search items")],
      ),
    );
  }
}
