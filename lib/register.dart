//import 'package:bestapp/login.dart';
import 'dart:core';

import 'package:bestapp/login.dart';
import 'package:bestapp/radia.dart';
import 'package:bestapp/regis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserRegister extends StatefulWidget {

@override
  _UserRegister createState() {
    
    return _UserRegister();
  }

}
class _UserRegister extends State<UserRegister>
{
  TextEditingController username = TextEditingController() ;
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();

  // int _currentIndex = 1;

  // List<Row> _group = [
  //   Row(
  //     text: "male",
  //     index: 1,
  //   ),
  //   Row(
  //     text: "female",     
  //     index: 2,)
  // ];
  
  @override
    Widget build(BuildContext context) {
    
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('User Register page'),
                        backgroundColor: Colors.green,
                      ),
                      body: Center(
                      
                        child: SingleChildScrollView(
                          
                          child: Container(
                        
                            color: Colors.transparent,
                            padding: EdgeInsets.all(20),
                            child: Center( 
                              child: Column(
                                
                                children: <Widget>[ 
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                   
                                    "Register",
                                    style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 30.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold
                                    ),
            
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                    
                                  ),
                                  SizedBox(height: 15.0,),
                                   TextField(
                                     autofocus: false,
                                     obscureText: false,
                                     keyboardType:TextInputType.text ,
                                     controller: username,
                                   // onChanged: (v) => username.text = v,
                                     decoration: InputDecoration(
                                       labelText: 'Username',
                                       hintText: 'Username',
                                       labelStyle:TextStyle(
                                         color: Colors.black,
                                         fontSize: 20.0,
                                         fontWeight: FontWeight.bold,
                                       )
                                     ),
                               ),
                              SizedBox(height: 15.0,),
                              TextField(
                                autofocus: false,
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                //onChanged: (v) => email.text = v,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ), 
                               // validator: (val) => !EmailValidator.Validate(val, true)
                  //  ? 'Not a valid email.'
                 //   : null,
                //onSaved: (val) => _email = val,   
                              ),
                              SizedBox(height: 15.0,),
                             TextField(
                               keyboardType: TextInputType.phone,
                               controller: phone,
                             // onChanged: (v) => phone.text = v,
                               decoration: InputDecoration(
                                 labelText: "Phone",
                                 hintText: "Phone",
                                 labelStyle: TextStyle(
                                   fontSize:20.0,
                                   color: Colors.black,
                                   fontWeight: FontWeight.bold,
                                   fontFamily: 'Montserrat',
                                    ),
                               ),
                             ),
                            // ListBody Radio()
                             SizedBox(
                               height: 20.0,
                               //child: Radio(),
                             ),
                            Rad(),

        //                 ListView(
      
        // //padding: EdgeInsets.all(8.0),
        // children: _group
        //     .map((item) => RadioListTile(
        //           groupValue: _currentIndex,
        //           title: Text("${item.text}"),
        //           value: item.index,
        //           onChanged: (val) {
        //             setState(() {
        //               _currentIndex = val;
        //             }
        //             );
        //           },
        //         )
        //         )
        //    .toList(),
    
   // ),




                            
                    //            Row(
                    //            children: <Widget>[
                    //             Text(
                    //               'Gender' ,
                    //              style: TextStyle(
                    //              color: Colors.black,
                    //              fontWeight: FontWeight.bold,
                    //              fontFamily: 'Montserrat',
                    //              fontSize: 20.0 ,
                    //              ),    
                    //              ) ,
                              
                    //  ],  
                    // ) ,
                              
                     
                     
                  
      
                  //  TextField(
                  //    keyboardType: TextInputType.text,
                  //    controller: gender,
                  //   // onChanged: (v) => gender.text = v,
                  //    decoration: InputDecoration(
                  //      labelText: 'Gender',
                  //      hintText: 'Gender',
                  //      labelStyle: TextStyle(
                  //        color: Colors.black,
                  //        fontSize: 20.0,
                  //        fontWeight: FontWeight.bold,
                  //        fontFamily: 'Montserrat'
                  //     )
                  //    ),
                  //   ),
                   SizedBox(height: 15.0,),
  
                   TextField(
                     obscureText: true,
                     keyboardType: TextInputType.text,
                     controller: password,
                    // onChanged: (v) => password.text = v,
                     decoration: InputDecoration(
                       labelText: 'Password',
                       hintText: 'Password',
                       labelStyle: TextStyle(
                         color: Colors.black,
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Montserrat'
                       )
                     ),
                   ),
                   SizedBox(
                   height: 20.0,
                ),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                  child: GestureDetector(
                    onTap: (){
                       
                          //saveData(context,emailEditingContrller.text.toString(),passEditingContrller.text.toString());
                                                                              
                                               saveData(context,username.text.toString(), email.text.toString(),phone.text.toString(),
                                               gender.text.toString(), password.text.toString());
                                             
                                    //  Navigator.push(
                                       // context,
                                        //MaterialPageRoute(builder: (context) =>Wel('a','n')),
                                    //  );
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSet()),
                                    );
                                            },
                                            child: Center(
                                              child: Text('Submit',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                          
                                              ),
                                              ),
                                              
                                            ),
                                          ),
                                          ),
                                        ),
                                         SizedBox(
                                            height: 15.0 ,),
                                           Container(
                                             alignment: Alignment(1.0, 0.0),
                                             padding: EdgeInsets.only(top:10 ,left: 10),
                                             child: InkWell(
                                               onTap: () {
                                     
                                     
                                    },
                                    
                                               child: Text(
                                                 'Back',
                                               style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Montserrat',
                                                fontSize: 30.0,
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
                          
                              );
                                  
                                 // void saveData(BuildContext context,var email, var pass, String text) async {
                                                // SharedPreferences prefs = await SharedPreferences.getInstance();
                                                // await prefs.setString('email',email.toString());
                                                // await prefs.setString('pass',pass.toString());
                                                //   var textToShow=await prefs.getString('email');
                                                //   var pwd=await prefs.getString('pass');
                                                //    print(textToShow);
                                                //    print(pass);      
                                                //           Navigator.push(context,MaterialPageRoute(builder: (context) => Wel(textToShow,pwd)),
                                                //                              );     
                                         }
                        
                          bool isValiadate(String name) {
                    
                           return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(name);

                          }
               
    }
  
    void saveData(BuildContext context,String u,String e,String p,String g, String pa)async{
      Map data1={'user':u,'email':e,'phone':p,'gender':g,
      'pass':pa
  
      };
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var d;
  //   await prefs.setString('map',d.toString());
  // await prefs.setString('email', email.toString());
  // await prefs.setString('phone', phone.toString());
  // await prefs.setString('gen', gender.toString());
  // var password;
  //   await prefs.setString('pass', password.toString());
  // var name1 =await prefs.getString('user');
  // var eml1 = await prefs.getString('email');
  // var phn1 = await prefs.getString('phone');
  // var gende1 =await prefs.getString('gen');
  // var pawd1 = await prefs.getString('pass');
  
                          print(u);
                          print(e);
                          print(p);
                          print(g);
                           print(pa);      
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginSet()),
                                                   );  
  // print(u);
  
    }
// class Row {
//   String text;
//   int index;
//   Row({this.text, this.index});
// }