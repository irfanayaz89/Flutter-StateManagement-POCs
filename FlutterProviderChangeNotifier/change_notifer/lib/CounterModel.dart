import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {

  int _counter = 0;

  int get counterValue => _counter;

  void incrementCounter() {
     
     _counter++;
     notifyListeners();
  }

}