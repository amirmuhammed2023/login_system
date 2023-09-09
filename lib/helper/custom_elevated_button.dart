import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
   custombutton({required this.yourtext,required this.onclick});
  String yourtext ;
  Function onclick ;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal:110),
          child: ElevatedButton(
            onPressed:onclick(),
            style: ElevatedButton.styleFrom(
              backgroundColor:Colors.black,
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20)
              ),
              ),
            child: Text(yourtext,style:TextStyle(fontSize:16),),
            
            ),
        );
  }
}