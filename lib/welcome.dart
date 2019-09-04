import 'package:flutter/material.dart';

class WelCome extends StatelessWidget{

@override
  Widget build(BuildContext context) {
  
    return MaterialApp(

      title: "Userlogin",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Userlogin"),
          
        ),
        body: Center(
          child: Text("Thanks for Sig In",),     
        ),
        
        
      ),
      
    ) ;
  }
}