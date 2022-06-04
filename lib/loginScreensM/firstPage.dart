import 'package:flutter/material.dart';
import 'package:hackthon/loginScreensM/Authentication/login.dart';

import '../styles/bottomImage.dart';
class StartingScreen extends StatelessWidget {
  const StartingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        
        Image.asset("assests/images/cropetop.png",),
       
       Text("Logo"),
       Text("Crowd Sourcing",style: TextStyle(fontSize: 18),),
       
        SizedBox(
          height: MediaQuery.of(context).size.height *0.45,
          child: BottomImage(butName: 'Get Started',))
      
      ]),
    );
  }
}

