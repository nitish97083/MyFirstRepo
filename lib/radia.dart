import 'package:flutter/material.dart';


class Rad extends StatefulWidget{

@override
  
_RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<Rad> {
  int _currentIndex = 1;

  List<GroupModel> _group = [
    GroupModel(
      text: "male",
      index: 1,
    ),
    GroupModel(
      text: "female",     
      index: 2,)
  ];
  @override
  Widget build(BuildContext context) {
    return  Row(
      
        //padding: EdgeInsets.all(8.0),
        children: _group
            .map((item) => RadListTile(
                  groupValue: _currentIndex,
                  title: Text("${item.text}"),
                  value: item.index,
                  onChanged: (val) {
                    setState(() {
                      _currentIndex = val;
                    }
                    );
                  },
                )
                )
            .toList(),
    //  ),
    );
  }
}

class GroupModel {
  String text;
  int index;
  GroupModel({this.text, this.index});
}