import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
Map x;
class Welcome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Welcome();
  }
}
class _Welcome extends State<Welcome>{
@override
void initState()
{
  get();
}
 void get()async{ 
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String g=prefs.getString('datasharedprefs');
    x=json.decode(g);
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(x['phon'].toString()),
            Text(x['nam'].toString()),
            Text(x['ag'].toString()),
            
          ],
        ),
      ),
    );
  }
}