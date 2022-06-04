import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hackthon/firebase/lib/homepage.dart';
import 'package:hackthon/loginScreensM/Authentication/login.dart';
import 'package:hackthon/loginScreensM/Authentication/otpScreen.dart';
import 'package:hackthon/loginScreensM/firstPage.dart';
import 'package:hackthon/screens/addingQuestions/accessGallery.dart';
import 'package:hackthon/screens/addingQuestions/addingquestions.dart';
import 'package:hackthon/screens/addingQuestions/bloc/preview2.dart';
import 'package:hackthon/Dashboard/dashboard.dart';
import 'package:hackthon/screens/printPage.dart';
import 'package:hackthon/screens/startingSlidesPage/startingPageSlide.dart';

import 'intialze.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp()); 
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //   initialRoute: '/GeneratedHomePageWidget',
      // routes: {
      //   '/GeneratedHomePageWidget': (context) => GeneratedHomePageWidget(),
      //   '/GeneratedLoginWidget': (context) => GeneratedLoginWidget(),
      //   '/GeneratedLoginWidget4': (context) => GeneratedLoginWidget4(),
      //   '/GeneratedRegisterWidget': (context) => GeneratedRegisterWidget(),
      //   '/GeneratedSignUpWidget': (context) => GeneratedSignUpWidget(),
      // },
      home: InitialiserWidget()
    ); 
  }
}