import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/details.dart';

class cartbag extends StatelessWidget {
  const cartbag({super.key});
  static String id = "cart" ;
  @override
  Widget build(BuildContext context) {
     final instanceofdetails = Provider.of<details>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: Text(
          "your shopping bag",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: instanceofdetails.detailsofproduct.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 7,
                  margin: EdgeInsets.all(9),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("${instanceofdetails.detailsofproduct[index].ima}"),
                    ),
                    subtitle: Text("${instanceofdetails.detailsofproduct[index].pri}"),
                    title: Text("${instanceofdetails.detailsofproduct[index].nam}"),
                    trailing: IconButton(
                      onPressed:(){
                        instanceofdetails.ecoleofmince(instanceofdetails.detailsofproduct[index]) ;
                      },
                      icon:Icon(Icons.delete ),
                      ),
                  ),
                ) ;
              },),
          ),
         Row(
           children: [
             Padding(
               padding: const EdgeInsets.all(12),
               child: Align(
                alignment:Alignment.topLeft,
                child: Text("Total :",style:TextStyle(color:Colors.grey.withOpacity(0.5),fontSize:30,fontWeight:FontWeight.bold),)),
             ),
             Padding(
               padding: const EdgeInsets.all(4),
               child: Text("${instanceofdetails.total}",style:TextStyle(fontSize:24,fontWeight:FontWeight.bold),),
             )
           ],
         ),
        Divider(
          color: Colors.black,
          thickness: 1,
         indent: 70,
         endIndent: 70,
         ), 
         SizedBox(height: MediaQuery.of(context).size.height * .005,),
         ElevatedButton(
              onPressed: () {},
              child: Text(
                  "Buy"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            ) 
        ],
      ),
      );
  }
}