

import 'package:flutter/material.dart';
import 'package:login_firebase/class/auth_firebase.dart';
import 'package:login_firebase/page/login_page.dart';
import 'package:login_firebase/page/root_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: LoginPage()
      home: RootPage(authFirebase:new AuthFirebase() ,),
    );
  }
}