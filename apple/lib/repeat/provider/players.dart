import 'package:flutter/cupertino.dart';

class Players extends ChangeNotifier {
  var player = [
    Player("lion", 11),
    Player("tiger", 13),
    Player("leopard", 15),
    Player("elephant", 11),
    Player("hyena", 13),
    Player("jaguar", 15),
    Player("zebra", 51),
  ];
  void increments(index) {
    player[index].power = player[index].power + 2;
    notifyListeners();
  }

  void decrements(index) {
    player[index].power = player[index].power - 2;
    notifyListeners();
  }
}

class Player {
  String name;
  int power;
  Player(this.name, this.power);
}
