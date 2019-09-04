//import 'package:bestapp/radia.dart' as prefix0;
import 'package:bestapp/radia.dart';
import 'package:bestapp/regis.dart';
import 'package:bestapp/register.dart';
import 'package:flutter/material.dart';
import './login.dart';
//import './register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 // String get v => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Userlogin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home:LoginSet(),
        home: Scaffold(
          body:Rad(),
        )
    // home: UserRegister(),
   // home: Regis(),
   
    );
  }
}


  
 






