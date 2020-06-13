
import 'package:flutter/material.dart';
import 'package:login_firebase/class/auth_firebase.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key,this.onSignIn,this.authFirebase}) : super(key: key);


    final VoidCallback onSignIn;
    final AuthFirebase authFirebase;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
            onPressed: signOut, 
            child: Text("Cerrar Sesion")
          )
        ],
      ),
    );
  }

  void signOut(){

    authFirebase.signOut();
    onSignIn();

  }
}