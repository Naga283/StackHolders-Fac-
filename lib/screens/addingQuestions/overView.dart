import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hackthon/Dashboard/dashboard.dart';
import 'package:hackthon/screens/subjectQues.dart';
class OverView extends StatefulWidget {
  const OverView({ Key? key, required this.overQuest, required this.overcorOpti, required this.overOpt1, required this.lead }) : super(key: key);
final List overQuest;
final List overcorOpti;
final List overOpt1;
final String lead;

  @override
  State<OverView> createState() => _OverViewState();
}
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
          Card(
             margin: EdgeInsets.only(left: 15,right: 15,bottom: 15,top: 10),
                        elevation: 6,
                       shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
            child: Container(
              margin: EdgeInsets.only(left: 30),
                           width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(widget.overQuest[0].toString(),style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                 widget.overcorOpti[0].toString()==widget.overOpt1[0].toString()? Text("a) ${widget.overOpt1[0].toString()}",style: TextStyle(fontSize: 20,color: Colors.green)):Text("a) ${widget.overOpt1[0].toString()}",style: TextStyle(fontSize: 20,color: Colors.black)),
                     SizedBox(height: 10,),
                    widget.overcorOpti[0].toString()==widget.overOpt1[1].toString()? Text("b) ${widget.overOpt1[1].toString()}",style: TextStyle(fontSize: 20,color: Colors.green)):Text("b) ${widget.overOpt1[1].toString()}",style: TextStyle(fontSize: 20)),
                     SizedBox(height: 10,),
                 widget.overcorOpti[0].toString()==widget.overOpt1[2].toString()? Text("c) ${widget.overOpt1[2].toString()}",style: TextStyle(fontSize: 20,color: Colors.green)):Text("c) ${widget.overOpt1[2].toString()}",style: TextStyle(fontSize: 20)),
                     SizedBox(height: 10,),
                  widget.overcorOpti[0].toString()==widget.overOpt1[3].toString()? Text("d) ${widget.overOpt1[3].toString()}",style: TextStyle(fontSize: 20,color: Colors.green)):Text("d) ${widget.overOpt1[0].toString()}",style: TextStyle(fontSize: 20)),
                 
                   
                 SizedBox(height: 20,)  
                 
                ],
              ),
            ),
          ),
            RaisedButton(onPressed: (){
              print(widget.overcorOpti[0].toString());
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectQues(ti: widget.lead,)));
            },child:Text("Finish")) 
        ],
      )
     
    );
  }

 
}