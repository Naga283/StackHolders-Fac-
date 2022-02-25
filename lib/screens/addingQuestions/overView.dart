import 'package:flutter/material.dart';
import 'package:hackthon/screens/dashboard.dart';
import 'package:hackthon/screens/subjectQues.dart';
class OverView extends StatefulWidget {
  const OverView({ Key? key, required this.overQuest, required this.overcorOpti, required this.overOpt1 }) : super(key: key);
final List overQuest;
final List overcorOpti;
final List overOpt1;

  @override
  State<OverView> createState() => _OverViewState();
}
enum SingingCharacter { lafayette, jefferson }
class _OverViewState extends State<OverView> {
  var _site ;
  var val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
      ),
      body:Column(
        children: [
          Text(widget.overQuest[0].toString(),style: TextStyle(fontSize: 26),),
          
         widget.overcorOpti[0].toString()==widget.overOpt1[0].toString()? Container(
           padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
           color: Colors.green,
           child: Text(widget.overOpt1[0].toString(),style: TextStyle(fontSize: 20))):Container(
             padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
             color: Colors.blue,
             child: Text(widget.overOpt1[0].toString(),style: TextStyle(fontSize: 20))),
             SizedBox(height: 10,),
            widget.overcorOpti[0].toString()==widget.overOpt1[1].toString()? Container(
                 padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
           color: Colors.green,
           child: Text(widget.overOpt1[1].toString(),style: TextStyle(fontSize: 20))):Container(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
             color: Colors.blue,
             child: Text(widget.overOpt1[1].toString(),style: TextStyle(fontSize: 20))),
             SizedBox(height: 10,),
         widget.overcorOpti[0].toString()==widget.overOpt1[2].toString()? Container(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
           color: Colors.green,
           child: Text(widget.overOpt1[2].toString(),style: TextStyle(fontSize: 20))):Container(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
             color: Colors.blue,
             child: Text(widget.overOpt1[2].toString(),style: TextStyle(fontSize: 20))),
             SizedBox(height: 10,),
          widget.overcorOpti[0].toString()==widget.overOpt1[3].toString()? Container(
               padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
           color: Colors.green,
           child: Text(widget.overOpt1[3].toString(),style: TextStyle(fontSize: 20))):Container(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
             color: Colors.blue,
             child: Text(widget.overOpt1[3].toString(),style: TextStyle(fontSize: 20))),
         
           
           
          RaisedButton(onPressed: (){
            print(widget.overcorOpti[0].toString());
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectQues()));
          },child:Text("Finish"))  
        ],
      )
    );
  }

 
}