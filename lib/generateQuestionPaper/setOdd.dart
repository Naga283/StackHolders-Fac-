

// ignore_for_file: prefer_null_aware_operators

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackthon/generateQuestionPaper/uniquekey.dart';


class SetA extends StatefulWidget {
  const SetA({ Key? key, required this.disQues, required this.noOfQues,}) : super(key: key);
  final String disQues;
  final int noOfQues;
  
  @override
  State<SetA> createState() => _SetAState();
}

class _SetAState extends State<SetA> {
  var val;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController uniqueValue = TextEditingController();
   DatabaseReference Databref = FirebaseDatabase.instance.ref("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
  final dref = FirebaseDatabase.instance.ref().child("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc");
    late DatabaseReference databaseReference ;
    List r=[];
    late int eve;
  
    
  showData() async{
    // print( FirebaseDatabase.instance
    //         .ref()
    //         .startAfter(documentList[documentList.length - 1])
    //         .limitToFirst(5)
    //         .get()));
    // dref.once().then((event) {
     
    //   print(";ijsdfa;kldjajl${(event.snapshot.value)}");
    // });
    // var query = dref.orderByChild("QUESTION ").limitToFirst(10);
    // DataSnapshot event = await query.get();
    // print(event.toString());
    //print("ata here33${dref.orderByChild("QUESTION ").startAt("W").once()}");

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    databaseReference = dref;
   
  }
  @override
  Widget build(BuildContext context) {
    
   print(showData());
 //  print("dafkadsnfa ${dref.orderByChild("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc").limitToFirst(20).once()}");
    
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
         title: Text(widget.disQues),
          elevation: 0,
      
        ),
      ),
      body: FirebaseAnimatedList(
        shrinkWrap: true,
        query: databaseReference, itemBuilder: (BuildContext context,DataSnapshot dataSnapshot,Animation animation,int index){
          var res =dataSnapshot.value as List; 
          r = res;
         
         
      return DataRetrieval(r: r, noQ: widget.noOfQues ,);
      }),
     bottomNavigationBar: FloatingActionButton.extended(onPressed: () { 

        showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('ID For Accessing Question Paper'),
            content: TextField(
              controller: uniqueValue,
              decoration:InputDecoration(hintText: 'Enter Unique Id')),
              
            actions: [
              TextButton(onPressed: (){
                
                dref.orderByChild("1aEimLPJ7sI5GnyuRa49BgofXbyoXWCPQVuQ5XU8xOnc").startAt(0).endAt(10);
                
                  setState(() {
                    fireStore.collection(uniqueValue.text).add({
          "Question":r[0],

          
          }).whenComplete(() => Navigator.pop(context));
                  });
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetSOfPaper()));
                
              }, child: Text('Add'),
              
              )
            ],
        );
        });
      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UniqueDataKey()));
      },
label: Text("Generate"),
     ), 
    );

  }
}

class DataRetrieval extends StatefulWidget {
  const DataRetrieval({
    Key? key,
    required this.r, required this.noQ, 
  }) : super(key: key);
  final int noQ;
  final List r;

  @override
  State<DataRetrieval> createState() => _DataRetrievalState();
}

class _DataRetrievalState extends State<DataRetrieval> {
    bool ans = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      
     stream: FirebaseDatabase.instance.ref()
            
            .onValue,
      builder: (context,databaseEvent){
    
      
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
           itemCount:  widget.r.length !=0 ? (widget.noQ)*2:0,
          itemBuilder: (BuildContext context,int index) {
            
         
          return index%(2)==0?Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                Text("${(index+1+1)/2}) ",style: TextStyle(fontSize:20)),
                   Flexible(child: Text("${widget.r[index]["QUESTION "]}",style: TextStyle(fontSize:20),)),
               ],),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  padding: EdgeInsets.only(bottom: 20,),
                  child: 
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: 10,),
                  Text("a) ${widget.r[index ][" OPTION A "]}"),
                   Text("b) ${widget.r[index]["OPTION B "]}"),
                   Text("c) ${widget.r[index]["OPTION C "]}"),
                   Text("d) ${widget.r[index ]["OPTION D"]}")
      
                    ],
                  )
                )
               ,
           
              
              ],
            ),
          ):Visibility(
            
           child: Text(""),
          );
        }),
      );
    }
    
  );
  }
}