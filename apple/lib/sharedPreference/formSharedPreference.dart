import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormSharedPreference extends StatefulWidget {
  @override
  _FormSharedPreferenceState createState() => _FormSharedPreferenceState();
}

class _FormSharedPreferenceState extends State<FormSharedPreference> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameControl = TextEditingController();
  TextEditingController emailControl = TextEditingController();
  String name = "";
  String email = "";
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameControl.dispose();
    emailControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form State"),
      ),
      body: ListView(
        children: [
          Container(
            height: 600,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    controller: nameControl,
                    decoration: InputDecoration(
                      labelText: "Enter the name",
                      hintText: "Enter the name",
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey[300]),
                      labelStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey[700]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide:
                              BorderSide(width: 10, color: Colors.blue[200])),
                      focusColor: Colors.green[200],
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[800])),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please Enter the value";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailControl,
                    decoration: InputDecoration(
                      labelText: "Enter the name",
                      hintText: "Enter the name",
                      hintStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey[300]),
                      labelStyle: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey[700]),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide:
                              BorderSide(width: 10, color: Colors.blue[200])),
                      focusColor: Colors.green[200],
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green[800])),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter value';
                      }
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    child: Text("Submit"),
                    elevation: 6,
                    color: Colors.blue[400],
                    focusColor: Colors.purple[700],
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        // Scaffold.of(context).showSnackBar(
                        //     SnackBar(content: Text('Processing Data')));
                        print("SUCCESS");
                      }
                      //fun fact you can directly do setstate and name= nameControl.text, but this name can travel in another page also
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString("GetFormName", nameControl.text);
                      pref.setString("GetFormEmail", emailControl.text);
                    },
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            height: 30,
            thickness: 4,
          ),
          RaisedButton(
            child: Text("Show Those Values"),
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              setState(() {
                // name = nameControl.text;
                // email = emailControl.text;
                //-------------------------------------Both up and down are correct
                name = pref.getString("GetFormName");
                email = pref.getString("GetFormEmail");
              });
            },
          ),
          Text(
            name,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
