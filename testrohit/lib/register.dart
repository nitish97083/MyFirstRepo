import 'package:flutter/material.dart';
import 'package:testrohit/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class Register extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Register();
  }

}
class _Register extends State<Register>{

TextEditingController name =TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController age =TextEditingController();
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body:Column(
        children: <Widget>[
          TextField(
            controller: name,

          ),
          TextField(controller: phone),
          TextField(controller: age,),
          RaisedButton(
            onPressed: () async {
          Map data ={
            'nam':name.text,
            'phon':phone.text.toString(),
            'ag':age.text,

          };
           print(data.toString());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String d=json.encode(data);
            prefs.setString('datasharedprefs',d);
    
      Navigator.push(context, MaterialPageRoute(builder: (context) =>SnackBarDemo()) 
      );     
            },
            child: Text('Submit'),
          )
        ],
      )
    );
  }
}