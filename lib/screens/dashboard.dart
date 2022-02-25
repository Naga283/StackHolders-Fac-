import 'package:flutter/material.dart';
import 'package:hackthon/screens/addingQuestions/addingquestions.dart';
import 'package:hackthon/screens/subjectQues.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: 
      GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectQues()));
        },
        child: Card(
          child: Row(
            children: [
              Text("FLAT",style: TextStyle(fontSize: 30),),
      
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
        
        onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddingQuestions()));
      },
      child: Text("count"),
      ),
    );
  }
}