import 'package:ecommercetwo/helper/colors.dart';
import 'package:ecommercetwo/helper/custom_form_field.dart';
import 'package:ecommercetwo/models/products.dart';
import 'package:ecommercetwo/services/firestore.dart';
import 'package:flutter/material.dart';

class addproduct extends StatelessWidget {
  addproduct({super.key});
  static String id = "addproduct";
  String? thename, theprice, thedescription, thecategory, theimage;
  final test3 = Store();
  final letsgo = GlobalKey<FormState>() ; 
  @override
  Widget build(BuildContext context) {
     var comeproduct = ModalRoute.of(context)!.settings.arguments ;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: letsgo,
        child: ListView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .220,
          ),
          customformfield(
              onboom: (value) {
                thename = value;
              },
              hint: "Name",
              youricon: Icons.person),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          customformfield(
              onboom: (value) {
                thedescription = value;
              },
              hint: "Description",
              youricon: Icons.note),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          customformfield(
              onboom: (value) {
                theprice = value;
              },
              hint: "Price",
              youricon: Icons.price_change),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          customformfield(
              onboom: (value) {
                thecategory = value;
              },
              hint: "Category",
              youricon: Icons.category),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          customformfield(
              onboom: (value) {
                theimage = value;
              },
              hint: "Image Path",
              youricon: Icons.image),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if(letsgo.currentState!.validate()){
                       test3.addyournewproduct(productmodel(
                        cat: thecategory,
                        des: thedescription,
                        ima: theimage, 
                        nam: thename, 
                        pri: theprice,
                       )) ; 
                    }
                  }, 
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width*.02
                  ),
                ElevatedButton(
                  onPressed: () {
                    if(letsgo.currentState!.validate()){ //عاوزين بعد كده نخليه مش اجبارى يعدل كل الفورم
                      test3.editproduct(comeproduct,{
                        kprice:theprice  ,
                        kcategory: thecategory , 
                        kname: thename , 
                        kimage: theimage,
                        kdescription: thedescription , 
                      }
                      ); 
                    }
                  }, 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Text(
                      "Edit",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
