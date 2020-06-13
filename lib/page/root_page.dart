
// la clase es el intermedio entre las paginas Login y home
//para saber si se esta login o home
import 'package:flutter/material.dart';
import 'package:login_firebase/class/auth_firebase.dart';
import 'package:login_firebase/page/home_page.dart';
import 'package:login_firebase/page/login_page.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key,this.authFirebase}) : super(key: key);

  final AuthFirebase authFirebase;

 

  @override
  _RootPageState createState() => _RootPageState();
}

 enum AuthStatus{
    notSignIn,
    signdIn,
  }

class _RootPageState extends State<RootPage> {
  //estado de la persona
  AuthStatus  authStatus= AuthStatus.notSignIn;

  //saber si esta logeado
  void initState(){
    //obtenemos el usuario actual con su ID
    widget.authFirebase.curretUser().then((useId) => 
    
    setState((){
          authStatus=useId!=null?AuthStatus.signdIn:AuthStatus.notSignIn;
    }),
    );
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    
    switch(authStatus){
      case AuthStatus.notSignIn:
       return LoginPage(auth: widget.authFirebase,onSignIn:()=>updateAuthStatus(AuthStatus.signdIn) ,);

      case AuthStatus.signdIn:
         return  HomePage(onSignIn: ()=>updateAuthStatus(AuthStatus.notSignIn),authFirebase:widget.authFirebase,);
    }
  }

  void  updateAuthStatus(AuthStatus auth){

    setState(() {
      authStatus = auth;
      
    });


  }
}


