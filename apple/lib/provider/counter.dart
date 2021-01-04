import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int count = 10;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void multiply(int num) {
    count = count * num;
    notifyListeners();
  }
}
