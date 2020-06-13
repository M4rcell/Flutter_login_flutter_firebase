

import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  // SIGN SESION
  Future<String> signIn(String email, String password) async {

    FirebaseUser  user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)) as FirebaseUser;

    return user.uid;
  }
  // CREATE COUNT
  Future<String> createUser(String email, String password) async {

    FirebaseUser  user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)) as FirebaseUser;

    return user.uid;
  }

  Future<void> signOut(){
    return firebaseAuth.signOut();

  }



}