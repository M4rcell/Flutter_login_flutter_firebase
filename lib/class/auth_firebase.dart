

import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase{
 
 //instancia para autentificacion con firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  
  //METODOS
  // SIGN SESION
  Future<String> signIn(String email, String password) async {
/* 
    FirebaseUser  user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
 */

    FirebaseUser user = (await firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;

    return user.uid;
  }
  // CREATE COUNT
  Future<String> createUser(String email, String password) async {

    /* FirebaseUser  user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)) as FirebaseUser;

    return user.uid; */
     FirebaseUser user = (await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
      return user.uid; 

  }
  //Si esta logeado o  no
  Future<String> curretUser() async {

    FirebaseUser  user = await firebaseAuth.currentUser();
    return user != null?user.uid:null;

  }

  Future<void> signOut(){
    return firebaseAuth.signOut();

  }



}