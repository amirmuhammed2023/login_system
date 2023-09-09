import 'package:firebase_auth/firebase_auth.dart';

class Auth {
final authh = FirebaseAuth.instance;

 signupp(String em , String pass)async{
  await authh.createUserWithEmailAndPassword(email: em, password: pass) ;
 }
 loginn(String em , String pass)async{
  await authh.signInWithEmailAndPassword(email: em, password: pass) ;
 }
}