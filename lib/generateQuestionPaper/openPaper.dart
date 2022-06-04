import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackthon/generateQuestionPaper/displayQuestions.dart';
class OpenPaper extends StatelessWidget {
  const OpenPaper({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    TextEditingController numbQues = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: numbQues,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter No.of Questions"
              ),
            ),
            GestureDetector(
              onTap: (){
                print(numbQues.text);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DisplayQuestion(disQues: numbQues.text, val: 2,)));
              },
              child: Container(
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}