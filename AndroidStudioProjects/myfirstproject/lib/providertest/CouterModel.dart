import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier{
  int count=0;
  int get _value =>count;
  void increment(){
    count++;
    notifyListeners();
  }
}