import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchComplex extends StatefulWidget {
  @override
  _SearchComplexState createState() => _SearchComplexState();
}

class _SearchComplexState extends State<SearchComplex> {
  String writtenInSearchBar;
  List data;
  List<Players> playerCopy = List<Players>();
  List<Players> playerActualDisplay = List<Players>();
  //give data
  Future getdata() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body);
    });
    var playersss = List<Players>();
    for (var u in data) {
      playersss.add(Players.fromJson(u));
    }
    return playersss;
  }

  //initialize state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata().then(
        (data) => {playerCopy.addAll(data), playerActualDisplay = playerCopy});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text("Click Search Icon to actually Search"),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: playerActualDisplay.length + 1,
              itemBuilder: (context, index) {
                return index == 0 ? searchBar() : beautifulContainer(index);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      decoration: InputDecoration(
          hintText: "Enter what you want to search!",
          hintStyle:
              TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[400]),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              writtenInSearchBar = writtenInSearchBar.toLowerCase();
              setState(() {
                playerActualDisplay = playerCopy.where((value) {
                  return value.name
                          .toLowerCase()
                          .contains(writtenInSearchBar) ||
                      value.email.toLowerCase().contains(writtenInSearchBar) ||
                      value.phone.toLowerCase().contains(writtenInSearchBar);
                }).toList();
              });
            },
          ),
          prefixIcon: Icon(Icons.circle),
          focusColor: Colors.green,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 4, color: Colors.green)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12), gapPadding: 2)),
      onChanged: (valueWritten) {
        setState(() {
          writtenInSearchBar = valueWritten;
        });
      },
    );
  }

  Widget beautifulContainer(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            playerActualDisplay[index - 1].name,
            style: fonter(),
          ),
          Text(playerActualDisplay[index - 1].email),
          Text(
            playerActualDisplay[index - 1].phone,
            style: fonter(),
          )
        ],
      ),
      height: 105,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.36),
                offset: Offset(3, 3)),
            BoxShadow(
                blurRadius: 10,
                color: Colors.blue[100].withOpacity(0.46),
                offset: Offset(-3, 3)),
          ],
          border:
              Border.all(color: Colors.grey[300].withOpacity(0.6), width: 2),
          borderRadius: BorderRadius.circular(17),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              colors: [Colors.orange[200], Colors.orange[600]],
              end: Alignment.topRight)),
    );
  }

  TextStyle fonter() {
    return TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
  }
}

class Players {
  String name;
  String email;
  String phone;
  Players(this.name, this.email, this.phone);
  Players.fromJson(Map json)
      : name = json["name"],
        email = json["email"],
        phone = json["phone"];
}
