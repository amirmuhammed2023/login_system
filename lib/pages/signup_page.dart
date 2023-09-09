import 'package:flutter/material.dart';
//import '../helper/custom_elevated_button.dart';
import '../helper/colors.dart';
import '../helper/custom_form_field.dart';
import '../services/auth.dart';
import 'login_page.dart';

class signup extends StatelessWidget {
   signup({super.key});
  static String id = "signup" ;
  final secondglobal = GlobalKey<FormState>();
  final test1 = Auth();
  String? emm , paa ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: secondglobal ,
        child: ListView(children: [
          SizedBox(height: MediaQuery.of(context).size.height*.250,),
          customformfield(hint:"Enter your first name", youricon: Icons.person,onboom:(value){},),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          customformfield(hint:"Enter your last name", youricon: Icons.person_2,onboom:(value){},),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          customformfield(hint:"Enter your E-mail",youricon:Icons.email,onboom:(value){emm = value;},),
          SizedBox(height: MediaQuery.of(context).size.height*.02,),
          customformfield(hint:"Enter your Password",youricon:Icons.password,onboom:(value){paa = value;},),
          SizedBox(height: MediaQuery.of(context).size.height*.05,),
          //custombutton(yourtext: "Sign up",onclick:(){},),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:110),
            child: ElevatedButton(
              onPressed:()async{
                if(secondglobal.currentState!.validate()){
                  await test1.signupp(emm!, paa!) ;        
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.black,
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20)
                ),
                ),
              child: Text("Sign Up",style:TextStyle(fontSize:16),),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).size.height*.05,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
            Text("already have e-mail? ",style:TextStyle(fontSize:17,color:Colors.white),),
            InkWell(
              onTap:(){
                Navigator.pushNamed(context, login.id);
              },
              child:Text(" login",style:TextStyle(fontSize:18),),
            )
          ],)
        ],),
      ),
    );
  }
}