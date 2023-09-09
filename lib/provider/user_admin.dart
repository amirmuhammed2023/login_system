import 'package:flutter/material.dart';

class adminuser extends ChangeNotifier{
  bool isshow = false ;
  changeadmin(bool value){
    isshow = value ;
    notifyListeners();
  }
}