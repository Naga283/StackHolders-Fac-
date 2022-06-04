// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hackthon/Dashboard/drawer.dart';
import 'package:hackthon/loginScreensM/Authentication/login.dart';
import 'package:hackthon/screens/startingSlidesPage/startingPageSlide.dart';

import 'package:hackthon/screens/subjectQues.dart';

import '../loginScreensM/Authentication/authentication.dart';
class DashBoard extends StatelessWidget {
  const DashBoard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title1 ="Flat";
    TextEditingController noOfQuestions = TextEditingController();
    int ques = 0;
    String title2 = "AI";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          automaticallyImplyLeading: false,
          
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: 20,),
              Text("Hi Naga!",style: TextStyle(fontSize: 16),),
              
              Text("Welcome Back 🖐",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          ),
          
          actions: [
             IconButton(onPressed: (){
                 AuthenticationHelper()
                          .signOut()
                          .then((_) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (contex) => OnBoardingPage()),
                              ));
               }, icon: Icon(Icons.logout,color: Colors.blue[100],)),
                   
          ],
        ),
      ),
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text("Subjects:",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                
                GestureDetector(
                  onTap: (){
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectQues(ti: title1,)));
                  },
                  child: Card(
                  
                    shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(title1,style: TextStyle(fontSize: 30),)),
                    
                  ),
                ),
                 GestureDetector(
                  onTap: (){
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectQues(ti: title2,)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("${title2}",style: TextStyle(fontSize: 30),)),
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
        
        onPressed: (){
         //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetSOfPaper()));
          showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Total No.of Questions'),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Flat:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   Text("40",style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 30,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("AI:",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                   Text(" 60",style: TextStyle(fontSize: 18),),
                  ],
                ),
              ],
            ),
              
            
        );
        
          }
          
          );
      },
      label: 
       Text("Count Of Questions"),
      ),
    );
  }
}