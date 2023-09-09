import 'package:flutter/material.dart';

class hup extends ChangeNotifier{
  bool isgo = false ;
  changestate(value){
    isgo = value ;
    notifyListeners();
  }
}