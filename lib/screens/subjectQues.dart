import 'package:flutter/material.dart';
import 'package:hackthon/screens/addingQuestions/overView.dart';
import 'package:hackthon/screens/addingQuestions/overallpreview.dart';

import 'addingQuestions/addingquestions.dart';
class SubjectQues extends StatelessWidget {
  final String ti;
  const SubjectQues({ Key? key, required this.ti,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List overQuest;
 List overcorOpti;
 List overOpt1;
    return Scaffold(
      appBar: PreferredSize(
           preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          centerTitle: true,
          
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),onPressed: (){
            Navigator.of(context).pop();
          },),
            title: Text(ti,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Accepeted Questions:    20",style: TextStyle(color: Colors.green,fontSize: 30),),
            SizedBox(height: 20,),
               Text("Rejected Questions:       10",style: TextStyle(color: Colors.red,fontSize: 30),),
               SizedBox(height: 20,),
                  Text("Waiting For Approval:       50",style: TextStyle(color: Colors.blue,fontSize: 30),),
                  SizedBox(height: 20,),
            OutlinedButton(onPressed: 
            (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OverAllPreview(lead: ti)));
            }, child: Text("Overall Preview")),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddingQuestions(head: ti,)));
      },
      child: Icon(Icons.add),
      ),
    );
  }
}