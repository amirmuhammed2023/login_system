import 'package:ecommercetwo/models/products.dart';
import 'package:flutter/material.dart';

class details extends ChangeNotifier {
  List<productmodel> detailsofproduct = [] ;
  double total = 0 ;
  int quantity = 1 ;
  
  ecoleofprice(productmodel p){
      detailsofproduct.add(p) ;
      total += double.parse(p.pri!).round() ;
      quantity += 1 ; 
      notifyListeners();
  }

  ecoleofmince(productmodel p){
   if (quantity >= 1) {
    detailsofproduct.remove(p) ;
    quantity -= 1 ;
    total -= double.parse(p.pri!).round() ;
   }
    /*else {
    throw "You can't do this process" ;
   }   */
    
    notifyListeners();
  }  
}