import 'package:flutter/foundation.dart';

class Players extends ChangeNotifier {
  List<Player> totalPlayer = [
    //or var totalPlayer
    Player("aman", 1000, 3),
    Player("bman", 3000, 4),
    Player("cman", 10000, 5),
    Player("dman", 4000, 3),
    Player("eman", 3000, 1)
  ];
  void incrementSalary(index) {
    totalPlayer[index].salary++;
    notifyListeners();
  }

  void decrementSalary(index) {
    totalPlayer[index].salary--;
    notifyListeners();
  }

  void multiplyRatings(index) {
    totalPlayer[index].rating *= 2;
    notifyListeners();
  }
}

class Player {
  int salary;
  int rating;
  String name;
  Player(this.name, this.salary, this.rating);
}
