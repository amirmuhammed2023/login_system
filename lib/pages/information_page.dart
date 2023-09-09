import 'dart:ffi';

import 'package:ecommercetwo/helper/colors.dart';
import 'package:ecommercetwo/models/products.dart';
import 'package:ecommercetwo/provider/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class info extends StatelessWidget {
  info({super.key});
  static String id = "infopage";
  @override
  Widget build(BuildContext context) {
    final instanceofdetails = Provider.of<details>(context);
    productmodel comedata =
        ModalRoute.of(context)!.settings.arguments as productmodel;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              instanceofdetails.quantity = 1 ;
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          "Details page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.54,
              width: double.infinity,
              child: Image.asset(
                comedata.ima!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  comedata.nam!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * .015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${comedata.des} this is good ${comedata.nam} you can buy it from this app , and add the number you need about it .",
                style: TextStyle(
                  fontSize: 17.5,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:(){
                     //try {
                     instanceofdetails.ecoleofmince(comedata); 
                     /*} on dynamic catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(e.message)));
                      }*/ 
                  },
                  icon:Icon(Icons.remove)),
                Text(
                  "${instanceofdetails.quantity}",
                  style: TextStyle(fontSize: 25),),
               IconButton(
                  onPressed:(){
                     instanceofdetails.ecoleofprice(comedata); 
                  },
                  icon:Icon(Icons.add)),
              ],
            ),
            Text("Press on icons to add or remove from your bagshop",style:TextStyle(color:Colors.blue),),  
            /*ElevatedButton(
              onPressed: () {},
              child: Text(
                  "Add to car  \$ ${instanceofdetails.total + double.parse(comedata.pri!)}"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
