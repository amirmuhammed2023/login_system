import 'package:ecommercetwo/pages/Admin/admin_page.dart';
import 'package:ecommercetwo/provider/progress_hub.dart';
import 'package:ecommercetwo/provider/user_admin.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:ecommercetwo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';
import '../helper/colors.dart';
import '../helper/custom_form_field.dart';
import '../services/auth.dart';
import 'signup_page.dart';

class login extends StatelessWidget {
  login({super.key});
  static String id = "login";
  final global = GlobalKey<FormState>();
  String? emm, paa;
  String passadmin = "Admin1234";
  //String? error ;
  final test2 = Auth();

  /*snackbarmessage(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$error")));
  }*/
  @override
  Widget build(BuildContext context) {
    final classinstance = Provider.of<hup>(context);
    final classinstance2 = Provider.of<adminuser>(context);
    return ModalProgressHUD(
      inAsyncCall: classinstance.isgo,
      child: Scaffold(
        backgroundColor: KMainColor,
        body: Form(
          key: global,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 15),
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "images/icons8-buy-100.png",
                      ),
                      Positioned(
                          bottom: 45,
                          child: Text(
                            "Buy It",
                            style:
                                TextStyle(fontFamily: "Pacifico", fontSize: 25),
                          ))
                    ],
                  ),
                ),
              ),
              customformfield(
                hint: "Enter your E-mail",
                youricon: Icons.email,
                onboom: (value) {
                  emm = value;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              customformfield(
                hint: "Enter your Password",
                youricon: Icons.password,
                onboom: (value) {
                  paa = value;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      _validate(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(
                      "login",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ),
              /*custombutton(yourtext: "Login",onclick:(){
                  setState(() {
                    
                  });
                  global.currentState?.validate();},),*/
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an e-mail? ",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, signup.id);
                    },
                    child: Text(
                      " Sign up",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    //classinstance.changestate(false);
                    classinstance2.changeadmin(true);
                  },
                  child: Text(
                    "I am an admin",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: classinstance2.isshow == false
                            ? Colors.black
                            : KMainColor),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    classinstance2.changeadmin(false);
                  },
                  child: Text(
                    "I am a user",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: classinstance2.isshow == false
                            ? KMainColor
                            : Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final classinstance = Provider.of<hup>(context, listen: false);
    final classinstance2 = Provider.of<adminuser>(context, listen: false);
    if (global.currentState!.validate()) {
      if (classinstance2.isshow == false) {
        try {
          classinstance.changestate(true);
          await test2.loginn(emm!, paa!);
          Navigator.pushNamed(context, homepage.id);
        } on dynamic catch (e) {
          classinstance.changestate(true);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message)));
        }
      } else {
        try {
          if (passadmin == paa) {
            classinstance.changestate(true);
            await test2.loginn(emm!, paa!);
            Navigator.pushNamed(context, adminpage.id);
          } else {
            classinstance.changestate(false);
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("E-mail or Password is wrong")));
          }
        } on dynamic catch (e) {
          classinstance.changestate(true);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message)));
        }
      }
      classinstance.changestate(false);
    }
  }
}
