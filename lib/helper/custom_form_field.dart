import 'package:flutter/material.dart';

import 'colors.dart';

class customformfield extends StatelessWidget {
   customformfield({required this.onboom,required this.hint, required this.youricon});
  String hint ;
  IconData youricon ;
  final void Function(String?) onboom ;
  errormessage(){
    switch(hint){
      case "Enter your first name" :  return "name is empty !" ;
      case "Enter your last name" : return "name is empty !" ;
      case "Enter your E-mail" : return "username is empty !" ;
      case "Enter your Password" : return "password is empty !" ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: TextFormField (
            validator:(value) {
              if(value!.isEmpty){
                return errormessage();
              }
            },
            onChanged: onboom ,
            obscureText:hint == "Enter your Password" ? true : false ,
            decoration: InputDecoration(
              fillColor: KSecondaryColor,
              filled: true,  
              prefixIcon:Icon(youricon,color:KMainColor,),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius:BorderRadius.circular(25),
                borderSide: BorderSide(color:KSecondaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:BorderRadius.circular(25),
                borderSide: BorderSide(color:KSecondaryColor),
              ),
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(25),
                borderSide: BorderSide(color:KSecondaryColor),
              ),
            ),
          ),
        );
  }
}