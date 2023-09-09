import 'package:ecommercetwo/helper/colors.dart';
import 'package:ecommercetwo/pages/cartbag.dart';
import 'package:ecommercetwo/pages/information_page.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';
import '../services/firestore.dart';

class homepage extends StatefulWidget {
   homepage({super.key});
  static String id = "homepage" ;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int numberofselect = 0 ;
  final test5 = Store();
  List<productmodel> allproducts1 = [];
  //List<productmodel> selectedproduct = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 4,
           child: Scaffold(
            appBar:AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom:TabBar(
                indicatorColor: KMainColor,
                onTap:(number){
                  setState(() {
                    numberofselect = number ;
                  });
                },             
                tabs:[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text("Jackets",style:TextStyle(
                    color:numberofselect == 0 ? Colors.black : kUnactiveColor,
                    fontSize:numberofselect == 0 ? 16 : 13 , 
                     )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text("Trousers",style:TextStyle(
                    color:numberofselect == 1 ? Colors.black : kUnactiveColor,
                    fontSize:numberofselect == 1 ? 16 : 13 ,
                    )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text("Shoes",style:TextStyle(
                    color:numberofselect == 2 ? Colors.black : kUnactiveColor,
                    fontSize:numberofselect == 2 ? 16 : 13 ,
                    )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text("T-shirts",style:TextStyle(
                    color:numberofselect == 3 ? Colors.black : kUnactiveColor,
                    fontSize:numberofselect == 3 ? 16 : 13 ,
                    )),
                ),
              ]), 
            ),
           body:TabBarView(children: [
                 getjackets(),
                 getproductbycategory("Trousers"),
                 getproductbycategory("Shoes"),
                 getproductbycategory("T-shirts")
            ]),
           )
           ),
           Material(
             child: Padding(
               padding: const EdgeInsets.only(left: 18,right: 18,top:38),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("DISCOVER",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:23),),
                IconButton(onPressed:(){
                   Navigator.pushNamed(context, cartbag.id) ;
                },
                 icon:Icon(Icons.shopping_cart,size:30)),
                //Icon(Icons.shopping_cart,size:30),
                ],
                     ),
             ),
           ),
      ],
    );
  }
  
  getjackets() {
     return StreamBuilder(
        stream: test5.loadingproduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<productmodel> allproducts = [];
            for (var element in snapshot.data!.docs) {
              allproducts.add(productmodel(
                  idd: element.id,
                  cat: element[kcategory],
                  nam: element[kname],
                  pri: element[kprice],
                  des: element[kdescription],
                  ima: element[kimage]));
            }
            allproducts1 = [...allproducts] ;
                allproducts.clear();

            theproductscategory(allproducts,"Jackets");
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                //crossAxisSpacing: 20 ,
                //mainAxisSpacing: 20 ,
              ),
              itemCount: allproducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                     Navigator.pushNamed(context, info.id,arguments:allproducts[index]) ;
                    },
                    child: GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.grey.withOpacity(.6),
                        title: Text(
                          "${allproducts[index].nam}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "\$ ${allproducts[index].pri}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      child: Container(
                          child: Image.asset(
                        fit: BoxFit.fill,
                        "${allproducts[index].ima}",
                      )),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                "Loading ....",
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      );
  }

  theproductscategory(List<productmodel> allproducts,String putcat) {
    for(var newproducts in allproducts1){
      if(newproducts.cat == putcat){
        allproducts.add(newproducts);
      }
    }
    //return allproducts ;
  }

  getproductbycategory(String putcat){
    List<productmodel> allproducts = [] ;
    theproductscategory(allproducts, putcat) ;
    return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                //crossAxisSpacing: 20 ,
                //mainAxisSpacing: 20 ,
              ),
              itemCount: allproducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, info.id,arguments:allproducts[index]) ;
                    },
                    child: GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.grey.withOpacity(.6),
                        title: Text(
                          "${allproducts[index].nam}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "\$ ${allproducts[index].pri}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      child: Container(
                          child: Image.asset(
                        fit: BoxFit.fill,
                        "${allproducts[index].ima}",
                      )),
                    ),
                  ),
                );
              },
            );
          }
}