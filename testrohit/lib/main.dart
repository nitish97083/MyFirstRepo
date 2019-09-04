import 'package:flutter/material.dart';
import 'package:testrohit/register.dart';
import 'package:testrohit/welcome.dart';

void main() => runApp(SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}
final TextEditingController a=TextEditingController();
final TextEditingController b=TextEditingController();
class SnackBarPage extends StatelessWidget {
  void show(BuildContext context){
    final snackBar1 = SnackBar(
                content: Text('Yay! A SnackBar!'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              final snackBar2=SnackBar(
                content: Text("Unsuccessful"),
              );
              // Find the Scaffold in the widget tree and use
              // it to show a SnackBar.
              if(a.text=="a@abc.com" && b.text=="1234")
              {
              Scaffold.of(context).showSnackBar(snackBar1);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Welcome()
              ),);
              }
              else
              Scaffold.of(context).showSnackBar(snackBar2);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          TextField(
            controller: a,
          ),
          TextField(
            controller: b
          ),
          RaisedButton(
            
            onPressed: () {
              show(context);
            },
            child: Text('Login'),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Register()),
  );
  
            },
            child: Text('Register'),
          )
        ],
      ),
    );
  }
}