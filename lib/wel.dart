import 'package:bestapp/login.dart';
import 'package:bestapp/register.dart';
import 'package:flutter/material.dart';
Map data={};
class Wel extends StatefulWidget{
Wel(Map d){
 data=d;
  
}
@override
  _Wel createState() {
     
    return _Wel();
  }

}
class _Wel extends State<Wel>{

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
                          
                  height: 70.0 ,),
                  
                  //Text(username),
                  Text(data['email'].toString()),
                  //Text(phone),
                 // Text(gender),
                  Text(data['password'].toString()),
                  
                          SizedBox(
                  height: 15.0 ,),
                 Container(
                   alignment: Alignment.bottomCenter,
                   padding: EdgeInsets.only(top:300 ,left: 40),
                   child: InkWell(
                     onTap: () {
           
                                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSet()),
                                                   );  
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