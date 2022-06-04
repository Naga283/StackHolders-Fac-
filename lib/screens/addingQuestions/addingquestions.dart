
// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackthon/screens/addingQuestions/accessGallery.dart';
import 'package:hackthon/screens/addingQuestions/overView.dart';
enum SingingCharacter { coropt1, coropt2,coropt3,coropt4 }
class AddingQuestions extends StatefulWidget {
  final String head;
  const AddingQuestions({ Key? key, required this.head }) : super(key: key);

  @override
  State<AddingQuestions> createState() => _AddingQuestionsState();
  
}

class _AddingQuestionsState extends State<AddingQuestions> {
   SingingCharacter? _character = SingingCharacter.coropt1;
   TextEditingController question = TextEditingController();
   String dropdownValue = 'Single Option';
   String difficulty = 'Easy';
// CollectionReference ref = FirebaseFirestore.instance.collection("Flat");
   
  
    @override
  void dispose() {
    question.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    final _form = GlobalKey<FormState>();
    TextEditingController corOption = TextEditingController();
    TextEditingController opti1 = TextEditingController();
    TextEditingController opti2 = TextEditingController();
    TextEditingController opti3 = TextEditingController();
    TextEditingController opti4 = TextEditingController();
bool dataErr =false;
    TextEditingController val = TextEditingController();
    var res;
    File gal;
   var _site; 
 List quesList=[];
 List opti=[];
 List corOpt =[];
    return Scaffold(
      appBar: AppBar(title: Text(widget.head+" Questions"),),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child: Column(
            children:[
              SizedBox(height: 20,),
              TextEntries(hintString: 'Enter Question', con: question, ),
              GalleryAccess(),
              Text("Answers",style: TextStyle(fontSize: 20),),
              Row(
                
                children: [

                  Text("Select Type of Question:    "),
                  DropdownButton(
                    value: dropdownValue,
                    items:<String>['Single Option', 'Multiple Options', 'Descriptive',]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
      }).toList(), onChanged: (String? val){
                      setState(() {
            dropdownValue = val!;
          });
                    })
                ],
              ),
                Row(
                
                children: [

                  Text("Select Difficulty:    "),
                  DropdownButton(
                    value: difficulty,
                    items:<String>['Easy', 'Medium', 'Hard',]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
      }).toList(), onChanged: (String? val){
                      setState(() {
            difficulty = val!;
          });
                    })
                ],
              ),
              Row(
                children: [
                  Form(
                    key: _form,
                    child: Text("Enter correct option:",style: TextStyle(fontSize: 20),)),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 60,
                    child: TextField(
                      keyboardType:TextInputType.number,
                      controller: val,
                      decoration: InputDecoration(
                        hintText: "Option"
                        
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
               TextEntries(hintString: "Enter Option 1", con: opti1,),
               SizedBox(height: 10,),
              TextEntries(hintString: "Enter Option 2", con: opti2, ),
              SizedBox(height: 10,),
            TextEntries(hintString: "Enter Option 3", con: opti3, ),
            SizedBox(height: 10,),
              TextEntries(hintString: "Enter Option 4", con: opti4,),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  quesList = quesList..add(question.text.toString());
                 if(val.text == '1'){
                  corOpt = corOpt..add(opti1.text.toString());
                   print(corOpt);
                   print("You selected 1");
                 }
                  if(val.text == '2'){
                  corOpt = corOpt..add(opti2.text.toString());
                   print(corOpt);
                   print("You selected 2");
                 }
                  if(val.text == '3'){
                  corOpt = corOpt..add(opti3.text.toString());
                   print(corOpt);
                   print("You selected 3");
                 }
                 if(val.text == '4'){
                  corOpt = corOpt..add(opti4.text.toString());
                   print(corOpt);
                   print("You selected 4");
                 }
                 opti = opti..add(opti1.text.toString());
                 opti = opti..add(opti2.text.toString());
                 opti = opti..add(opti3.text.toString());
                 opti = opti..add(opti4.text.toString());
             if(_form.currentState!.validate()){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OverView(overQuest: quesList, overcorOpti: corOpt, overOpt1: opti,)));
  FirebaseFirestore.instance.collection(widget.head).add({
'Question':question.text,
'Option1':opti1.text,
'Option2':opti2.text,
'Option3':opti3.text,
'Option4':opti4.text,
'coreOptionVal':val.text
  }).whenComplete(() => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OverView(overQuest: quesList, overcorOpti: corOpt, overOpt1: opti, lead: widget.head,))));

             }
                  
               
                  print(quesList+opti+corOpt);
                 
                },
                child: Container(
                  padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: Text("Submit")),
              )
              
          
            ]
          ),
        ),
      ),
    );
  }
}

class TextEntries extends StatelessWidget {
  TextEntries({
    Key? key, required this.hintString,required this.con, 
  }) : super(key: key);
  
final String hintString;
final TextEditingController con;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: con,
      decoration: InputDecoration(hintText: hintString,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(25.0),
      ),
       focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
       ),),
       validator: (text) {
                if (con.text == null || con.toString().isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
      
    );
  }
}