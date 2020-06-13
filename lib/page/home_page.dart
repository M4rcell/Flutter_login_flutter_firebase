
import 'package:flutter/material.dart';
import 'package:login_firebase/class/auth_firebase.dart';
import 'package:login_firebase/page/animal_from_page.dart';

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
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => FormAnimal(titulo: "Nuevo Animal",)            
          ));
        },
        shape: StadiumBorder(),
        backgroundColor: Colors.redAccent,
        child:Icon(Icons.add,size: 20.0,),
      ) ,
    );
  }

  void signOut(){

    authFirebase.signOut();
    onSignIn();

  }
}