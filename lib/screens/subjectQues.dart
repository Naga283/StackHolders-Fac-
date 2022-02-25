import 'package:flutter/material.dart';

import 'addingQuestions/addingquestions.dart';
class SubjectQues extends StatelessWidget {
  const SubjectQues({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flat"),),
        floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddingQuestions()));
      },
      child: Icon(Icons.add),
      ),
    );
  }
}