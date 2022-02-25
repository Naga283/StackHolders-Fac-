import 'package:flutter/material.dart';
import 'package:hackthon/screens/addingQuestions/accessGallery.dart';
import 'package:hackthon/screens/addingQuestions/addingquestions.dart';
import 'package:hackthon/screens/addingQuestions/radio.dart';
import 'package:hackthon/screens/dashboard.dart';
import 'package:hackthon/screens/paint/anotherpaint.dart';
import 'package:hackthon/screens/paint/paint.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: DashBoard(),),
    ); 
  }
}