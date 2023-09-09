import 'package:ecommercetwo/pages/Admin/add_product.dart';
import 'package:ecommercetwo/pages/Admin/admin_page.dart';
import 'package:ecommercetwo/pages/Admin/update_product.dart';
import 'package:ecommercetwo/pages/cartbag.dart';
import 'package:ecommercetwo/pages/home_page.dart';
import 'package:ecommercetwo/pages/information_page.dart';
import 'package:ecommercetwo/pages/signup_page.dart';
import 'package:ecommercetwo/provider/details.dart';
import 'package:ecommercetwo/provider/progress_hub.dart';
import 'package:ecommercetwo/provider/user_admin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:provider/provider.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => hup(),
        ),
        ChangeNotifierProvider(
          create: (context) => adminuser(),
        ),
        ChangeNotifierProvider(
          create: (context) => details(),
        ),
      ],
      child: MaterialApp(
        initialRoute: login.id,
        routes: {
          login.id: (context) => login(),
          signup.id: (context) => signup(),
          homepage.id: (context) => homepage(),
          adminpage.id: (context) => adminpage(),
          addproduct.id: (context) => addproduct(),
          updateproduct.id: (context) => updateproduct(), 
          info.id: (context) => info() ,
          cartbag.id: (context) => cartbag() ,
        },
        home: signup(),
      ),
    );
  }
}
