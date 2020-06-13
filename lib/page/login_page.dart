
import 'package:flutter/material.dart';
import 'package:login_firebase/class/auth_firebase.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  
  final AuthFirebase auth;

  @override
  _LoginPageState createState() => _LoginPageState();
}


enum FormType{
  login,
  register

}
class _LoginPageState extends State<LoginPage> {

  final  formKey = new GlobalKey<FormState>();
  FormType formType = FormType.login;
  var email = TextEditingController();
  var password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login") ,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children:  formLogin(),
            
          )),
      ),
       
    );
  }

  List<Widget>formLogin(){
    return [

      TextField(
      controller: email, // obtener input text
      //autofocus: true,
      // pone en mayuscula al inicio de cada palabra
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        //TextField de forma BorderCicular
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0)
        ),
      //counterText:'Letras  ${_nombre.length}',
      hintText: 'Ingrese su Email',
      labelText: 'Email',
     
      icon: Icon(Icons.account_circle,color: Colors.blue,)
      ),
      ),
      /* padded(
        child: TextFormField(
            decoration: InputDecoration(
              
              icon: Icon(Icons.person),
              labelText: "Correo",
              hintText: "Correo"),
            autocorrect: false,
        ),
      ), */
       SizedBox(height: 15.0,),
        
       Row(children: <Widget>[
            Icon(Icons.lock,color: Colors.blue,),
           
            Container(
              width: 300 ,
              padding: EdgeInsets.only(left: 14),
              
             child: PasswordField(
               controller: password,
              //suffixIcon:Icon(Icons.lock),
              color: Colors.blue,
              hasFloatingPlaceholder: true,
              pattern: r'.*[@$#.*].*',
              border: OutlineInputBorder(                
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(width: 2, color: Colors.blue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2, color: Colors.blue)),
              errorMessage: 'must contain special character either . * @ # \$',
        ),)
            
       ],
       ),
        
          /* 
          padded(
          child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: "Contraseña",
            hintText: "Contraseña"),
            autocorrect: false,
            obscureText: true,
            )
        ), */
      SizedBox(height: 15.0,),
      Column(
        children:buttonWidget(),

      )
    ];

  }
  List<Widget> buttonWidget(){

    switch(formType){

      case FormType.login:
           return[styleButton("Iniciar Session", validateSubmit)
             ,
           FlatButton(
              child: Text("No tienes una Cuenta? Registrate"),
             onPressed: ()=> updateFormType(FormType.register),  
            
           ),
           ];

      case FormType.register:
           return[styleButton("Crear Cuenta", validateSubmit),
           FlatButton(
              child: Text("Iniciar Session"),
             onPressed: ()=> updateFormType(FormType.login), 
            
           ),
           ];

    }

  }
   void updateFormType( FormType form){
     
      setState(() {
       formType=form;
     });

     formKey.currentState.reset();
    
   }

  void validateSubmit(){
    (formType == FormType.login)?widget.auth.signIn(email.text, password.text):widget.auth.createUser(email.text, password.text);
    //(formType == FormType.login)?print("login"):print("registar");   
                                //si es         // eslse
  }

  Widget styleButton(String text,VoidCallback onPressed){// VoidCallback recibir una funcion
    
  return  RaisedButton(
      onPressed: onPressed,
      color: Colors.blue,
      textColor:Colors.white ,
      child: Text(text),
    );
  }
  
  Widget padded({TextFormField child}){

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );

  }
}