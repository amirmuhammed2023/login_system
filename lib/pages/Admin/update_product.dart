import 'package:ecommercetwo/helper/colors.dart';
import 'package:ecommercetwo/models/products.dart';
import 'package:ecommercetwo/pages/Admin/add_product.dart';
import 'package:ecommercetwo/services/firestore.dart';
import 'package:flutter/material.dart';

class updateproduct extends StatelessWidget {
  updateproduct({super.key});
  static String id = "updateproduct";
  final test4 = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: test4.loadingproduct(),
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
                    onTapUp: (va) {
                      double dx = va.globalPosition.dx,
                          dy = va.globalPosition.dy,
                          dx2 = MediaQuery.of(context).size.height - dx,
                          dy2 = MediaQuery.of(context).size.height - dy;
                      showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                          items: [
                            PopupMenuItem(
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, addproduct.id,arguments:allproducts[index].idd );
                                    }, child: Text("Edit"))),
                            PopupMenuItem(
                                child: GestureDetector(
                                    onTap: () {
                                       test4.deleteproduct(allproducts[index].idd);         
                                    }, child: Text("Delete")))
                          ]);
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
      ),
    );
  }
}
