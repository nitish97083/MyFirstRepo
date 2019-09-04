import 'package:bestapp/login.dart';
import 'package:bestapp/register.dart';
import 'package:flutter/material.dart';
var email ;
var pass ;
var username ;
var phone ;
//var pass = "";
 var gender ;
  Map data3;
class Regis extends StatefulWidget{
 
Regis(Map data2){
  // username =u;
  // email=e;
  // phone = p;
  // gender = gnd;
  // pass=pwd
  data3 = data2;
}
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   return null;


@override
  _Reg createState() {
    
    return _Reg();
  }
}

class _Reg extends State<Regis>{

  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                
                   child:Column(
                     children: <Widget>[
                        SizedBox(
                          
                        height: 20.0 ,),

                        Text("Thanks for Rgister",
                        ),
                        SizedBox(
                          
                  height: 40.0 ,),
                  
                  // Text(username),
                  // Text(email),
                  // Text(phone),
                  // Text(gender),
                  // Text(pass),

         // var name1 =await prefs.getString('user');
          // var eml1 = await prefs.getString('email');
         // var phn1 = await prefs.getString('phone');
         // var gende1 =await prefs.getString('gen');
           // var pawd1 = await prefs.getString('pass');
  




                   Text(data3['user'].toString()),
        
                  Text(data3['email'].toString()),
                  Text(data3['phone'].toString()),
        
                  Text(data3['gender'].toString()),
                   Text(data3['pass'].toString()),
        
              
                  
                          SizedBox(
                  height: 15.0 ,),
                 Container(
                   alignment: Alignment.bottomCenter,
                   padding: EdgeInsets.only(top:300 ,left: 40),
                   child: InkWell(
                     onTap: () {
           
                             //   Navigator.push(context,MaterialPageRoute(builder: (context) => UserRegister()),
                                                 //  );  
          },
          
                     child: Text(
                       'Back',
                     style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      decoration: TextDecoration.underline
                        ), 
                       ),
                     
                     ),
                   ),
                
                ],
                ),
                ),
              ),
            ),
          
            ), 
        ) ;
  }
}