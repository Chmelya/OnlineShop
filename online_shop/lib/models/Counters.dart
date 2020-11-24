import 'package:flutter/material.dart';

class CounterForCart with ChangeNotifier {
  int value = 1;

  void increment(){
    value++;
    notifyListeners();
  }

  void decrement(){
    if(value >= 0){
      value--;
    }
  }

  void setStart(){
    value = 1;
  }
}

class CounterForCategories with ChangeNotifier {
  int value = 0;

  void set setValue(int val){
    value = val;
    notifyListeners();
  }
}