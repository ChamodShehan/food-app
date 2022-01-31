import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{

  int _count=0;

  int getCount(){
    return _count;
  }

  void increaseCount(){
    _count++;
    notifyListeners();
    
  }
  void dereaseCount(){
    _count--;
    notifyListeners();
  }
}