import 'package:flutter/cupertino.dart';

class Counters extends ChangeNotifier {
  var player = [
    Players("lion", 11),
    Players("lion", 11),
    Players("lion", 11),
    Players("lion", 11)
  ];
  var count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}

class Players {
  String name;
  int rating;
  Players(this.name, this.rating);
}
