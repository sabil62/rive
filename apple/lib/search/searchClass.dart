import 'package:flutter/material.dart';

class Playerss {
  String name;
  String email;
  Playerss(this.name, this.email);
  Playerss.clone(Playerss source)
      : this.name = source.name,
        this.email = source.email;
}

class SearchClass extends StatefulWidget {
  @override
  _SearchClassState createState() => _SearchClassState();
}

class _SearchClassState extends State<SearchClass> {
  List<Playerss> playering = [
    Playerss("aman", "bion@gmail.com"),
    Playerss("bbbb", "bbbb@gmail.com"),
    Playerss("ccccc", "ccccc@gmail.com"),
    Playerss("dddd", "dddd@gmail.com"),
    Playerss("dfman", "eee@gmail.com"),
    Playerss("adfsman", "fff@gmail.com"),
    Playerss("aman", "aman@gmail.com"),
    Playerss("aman", "aman@gmail.com"),
    Playerss("aman", "aman@gmail.com"),
    Playerss("aman", "aman@gmail.com"),
  ];

  List<Playerss> playerActualDisplay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // playerActualDisplay =
    //     playering.map((item) => new Playerss.clone(item)).toList();
    playerActualDisplay = [...playering];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search Class"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: playerActualDisplay.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? searchBar()
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
                              Text(playerActualDisplay[index - 1].name),
                              Text(playerActualDisplay[index - 1].email)
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
        ));
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
            playerActualDisplay = playering.where((value) {
              return value.name.toLowerCase().contains(valueWritten) ||
                  value.email.toLowerCase().contains(valueWritten);
            }).toList();
          });
        },
      ),
    );
  }
}

//   MyModal.clone(MyModal source) :
//       this.myField1 = source.myField1,
//       this.myField2 = source.myField2,
//       this.adjacentNodes = source.adjacentNodes.map((item) => new MyModal.clone(item)).toList();
// }

// var secondList = originalList.map((item) => new MyModal.clone(item)).toList();
