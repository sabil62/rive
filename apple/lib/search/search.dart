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
    var employees = List<Employee>();
    //---------------Check this
    for (var u in data) {
      employees.add(Employee.fromJson(u));
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Search items"),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: emplpoyeeDisplayInSearch.length + 1,
              itemBuilder: (context, index) {
                return index == 0
                    ? searchbar()
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.orange[200]),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(emplpoyeeDisplayInSearch[index - 1].name),
                                Text(emplpoyeeDisplayInSearch[index - 1].email)
                              ],
                            ),
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget searchbar() {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300])),
          hintText: 'Enter a search term',
          focusColor: Colors.green,
          hintStyle: TextStyle(
            color: Colors.purple,
            fontStyle: FontStyle.italic,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green[900]))),
      onChanged: (valueWritten) {
        valueWritten = valueWritten.toLowerCase();
        setState(() {
          emplpoyeeDisplayInSearch = employeeCopy.where((value) {
            return (value.name.toLowerCase().contains(valueWritten) ||
                value.email.toLowerCase().contains(valueWritten));
          }).toList();
        });
      },
    );
  }
}
