import 'package:flutter/material.dart';
class UniqueDataKey extends StatelessWidget {
  const UniqueDataKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column( 
        children: 
          [
            SizedBox(height: 30,),
            TextField(
            decoration: InputDecoration(
              hintText: "Enter Unique Key"
            ),
          ),
  SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
            color: Colors.blue,
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}