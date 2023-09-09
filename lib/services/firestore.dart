import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommercetwo/helper/colors.dart';
import 'package:ecommercetwo/models/products.dart';
class Store{
  final fstore = FirebaseFirestore.instance ;
   
  addyournewproduct(productmodel pro)async{
    await fstore.collection(kmainproduct).add({
      kname : pro.nam,
      kdescription : pro.des,
      kcategory : pro.cat,
      kprice : pro.pri,
      kimage : pro.ima,
    }) ; 
  }

  Stream<QuerySnapshot> loadingproduct(){
   return fstore.collection(kmainproduct).snapshots();
  }

  deleteproduct(documentid){
    fstore.collection(kmainproduct).doc(documentid).delete();
  }

  editproduct(documnentid,data){
    fstore.collection(kmainproduct).doc(documnentid).update(data);
  }
}