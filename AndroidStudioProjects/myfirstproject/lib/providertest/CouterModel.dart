import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier{
  int _count=0;
  int get _value =>_count;
  void increment(){
    _count++;
    notifyListeners();
  }
}