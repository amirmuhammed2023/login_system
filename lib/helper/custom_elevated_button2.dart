import 'package:flutter/material.dart';

class custombutton2 extends StatelessWidget {
   custombutton2({required this.hint,required this.oncliiick, required this.padd});
  String hint ;
  final void Function() oncliiick ;
  double padd ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
         onPressed:oncliiick,
         style:ElevatedButton.styleFrom(
          backgroundColor:Colors.grey
         ),
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal:padd),
           child: Text(hint,style:TextStyle(color:Colors.black,fontSize:15),),
         ));
  }
}