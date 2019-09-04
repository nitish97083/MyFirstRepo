import 'package:bestapp/regis.dart';
import 'package:bestapp/wel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:shared';
import './register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSet extends StatefulWidget{

@override
  _LoginSet createState() {
  
    return _LoginSet();

  }
}
class _LoginSet extends State<LoginSet>{

  TextEditingController emailEditingContrller = TextEditingController();
TextEditingController passEditingContrller  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     body: Center(
       child:SingleChildScrollView(
         child: Container(
           color: Colors.transparent,
           padding: EdgeInsets.all(20),
           child: Center(
             child: Column(
               children: <Widget>[
                 SizedBox(
                   height: 20.0,
                 ),
                 Center(
                   child: SizedBox(
                     width: 400.0,
                     height: 200.0,
                     child: Image.asset('assets/FlutterDart.png'),

                    
                   ),
                 ),
                 SizedBox(
                   height:15.0,
                 ),
                TextField(
                  autofocus: false,
                  obscureText: false,

                  keyboardType: TextInputType.emailAddress,
                  controller: emailEditingContrller,
                //  onChanged: (v) => emailEditingContrller.text = v,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "Email",
                    labelStyle: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 5.0,
                      color: Colors.blueGrey,
                      style: BorderStyle.solid,

                      )
                    )
                  ),
                ),
                SizedBox(
                  height: 15.0,
                  ),
              TextField(
                   autofocus: false,
                   obscureText: true,
                   keyboardType: TextInputType.text,
                   controller: passEditingContrller,
                   decoration: InputDecoration(
                     labelText: 'password',
                     hintText: 'password',
                     labelStyle: TextStyle(
                       color:Colors.black,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Montserrat',
                       fontSize: 20.0,
                        ),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15.0)
                   ),
                   borderSide: BorderSide(
                     width: 1,
                     color: Colors.blueGrey,
                     style: BorderStyle.solid,)
                   ),
                   ),
              ),
              SizedBox(
                  height: 15.0 ,),
                 Container(
                   alignment: Alignment(1.0, 0.0),
                   padding: EdgeInsets.only(top:10.0 ,left: 10.0),
                   child: InkWell(
                     child: Text(
                       'Forget Password',
                     style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.underline
                     ), 
                   ),
                     
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
                 onTap: ()
                  {
                    final snackBar = SnackBar(
            content: Text('Please Register first'),
            
          );
         Scaffold.of(context).showSnackBar(snackBar);   

                     String name=emailEditingContrller.text.toString();
                    if(emailEditingContrller.text.isEmpty){
                    //    print("email field is empty");
                       Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text("email is empty"),
                              ));

                       return;
                     }
                     if(passEditingContrller.text.isEmpty){
                       print("pass field is empty");
                       return;
                     }
                     String passwd=passEditingContrller.text.toString();
                     if(isPasswdValid(passwd)){
                                            return;
                                          }
                                             if(!isValiadate(name)){
                                        //final snackBar = SnackBar(content: Text('Email is not ion formated'));
                                             
                                             // Find the Scaffold in the widget tree and use it to show a SnackBar.
                                                                       return;
                                                                                             }

                                                                               Navigator.push(context,MaterialPageRoute(builder: (context) => Regis(data)),
                                                                                                 
                                                                                               );               
                                                                 
                                                                saveData(context,emailEditingContrller.text.toString(),
                                                                            passEditingContrller.text.toString());
                                                                                                
                                                                                  },
                                                                                                       child: Center(
                                                                                                         child: Text('Login',
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
                                                                                                         height:30.0,
                                                                                                       ),
                                                                                                       Row(
                                                                                                         mainAxisAlignment: MainAxisAlignment.center,
                                                                                                         children: <Widget>[
                                                                                                           Text('This is Great !!',
                                                                                                           style: TextStyle(
                                                                                                             fontSize: 15,
                                                                                                             color: Colors.black,
                                                                                                             fontFamily:'Montserrat'
                                                                                                              ),
                                                                                                           ),
                                                                                                           SizedBox(
                                                                                                             width: 30.0,
                                                                                                           ),
                                                                                                           InkWell(
                                                                                                             onTap: (){
                                                                                                               Navigator.push(
                                                                                         context,
                                                                                         MaterialPageRoute(builder: (context) => UserRegister()),
                                                                                       );
                                                                                                             },
                                                                                                             child: Text('Register',
                                                                                                             style: TextStyle(
                                                                                                               fontSize: 30.0,
                                                                                                               color: Colors.green,
                                                                                                               fontFamily: 'Montserrat',
                                                                                                               fontWeight: FontWeight.bold,
                                                                                                               decoration: TextDecoration.underline
                                                                                                             ),
                                                                                                             ),
                                                                                                           )
                                                                                                           
                                                                                                         ],
                                                                                                       ) 
                                                                                     
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ) 
                                                                                            ,)
                                                                                          ); 
                                                                                       }
                                             
                                              bool isValiadate(String name) {
                                         
                                                return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(name);
                     
                                                             
                                         }
                                         
                                         void saveData(BuildContext context,var email, var pass) async {
                                           SharedPreferences prefs = await SharedPreferences.getInstance();
                                           await prefs.setString('ema',email.toString());
                                           await prefs.setString('pass',pass.toString());
                                             
                                             var textToShow=await prefs.getString('ema');
                                             var pwd=await prefs.getString('pass');
                                              print(textToShow);
                                              print(pass);      
                                              Map data={
                                                "email":textToShow,
                                                "password":pwd
                                              };
                                                     Navigator.push(context,MaterialPageRoute(builder: (context) => Regis(data)),
                                                                       );     
                                             }
                     
                       bool isPasswdValid(String passwd) {
                         //String regExp=
                         return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(passwd);
                       }

                       // bool isValiadate(String name) {
                                         
                                       //         return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(name);
                     

}
