import 'package:ecommercetwo/pages/Admin/add_product.dart';
import 'package:ecommercetwo/pages/Admin/update_product.dart';
import 'package:flutter/material.dart';
import '../../helper/colors.dart';

class adminpage extends StatelessWidget {
  const adminpage({super.key});
  static String id = "adminpage" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: KMainColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.black,size: 30,)),
      ),
      backgroundColor: KMainColor,
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        //crossAxisAlignment:CrossAxisAlignment.center,
        children: [
        SizedBox(width:double.infinity,),
        ElevatedButton(
         onPressed:(){
          Navigator.pushNamed(context, addproduct.id);
         },
         style:ElevatedButton.styleFrom(
          backgroundColor:Colors.grey
         ),
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal:15),
           child: Text("Add Product",style:TextStyle(color:Colors.black,fontSize:15),),
         )),
         ElevatedButton(
         onPressed:(){
          Navigator.pushNamed(context, updateproduct.id) ;
         },
         style:ElevatedButton.styleFrom(
          backgroundColor:Colors.grey
         ),
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal:4),
           child: Text("Update Product",style:TextStyle(color:Colors.black,fontSize:15),),
         )),
         /*ElevatedButton(
         onPressed:(){
         },
         style:ElevatedButton.styleFrom(
          backgroundColor:Colors.grey
         ),
         child: Padding(
           padding:  EdgeInsets.symmetric(horizontal:7),
           child: Text("Delete Product",style:TextStyle(color:Colors.black,fontSize:15),),
         ))*/
        /*custombutton2(hint:"Add Product", oncliiick:()async{await Navigator.pushNamed(context,adminpage.id);},padd: 15,),
        custombutton2(hint:"Update Product", oncliiick:(){},padd:4,),
        custombutton2(hint:"Delete Poduct", oncliiick:(){},padd: 9,),*/
      ],),
    );
  }
}