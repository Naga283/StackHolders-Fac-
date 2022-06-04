import 'package:flutter/material.dart';
import 'package:hackthon/generateQuestionPaper/displayQuestions.dart';
import 'package:hackthon/generateQuestionPaper/setOdd.dart';
class SetSOfPaper extends StatelessWidget {
  const SetSOfPaper({ Key? key, required this.val }) : super(key: key);
final int val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 2,
      children: [
        GestureDetector(
          onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetA(disQues: "Set A", noOfQues: val,)));
          },
          child: Card(
            child: Text("Set A"),   
          ), 
        ),
        GestureDetector(
          onTap: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayQuestion(disQues: 'Set B', val: 2,))) ;
          },
          child: Card(
            child: Text("Set B"),
          ),
        ),
      ],
      ),
    );
  }
}