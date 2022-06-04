import 'package:flutter/material.dart';
import 'package:hackthon/Dashboard/dashboard.dart';

import '../loginScreensM/Authentication/login.dart';
class BottomImage extends StatelessWidget {
  const BottomImage({
    Key? key, required this.butName,
  }) : super(key: key);
final String butName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        
        
          Image.asset("assests/images/cropbottom.png"),
          
             // ignore: unnecessary_new
             new Align(
               alignment: FractionalOffset.bottomRight,
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(
                      16
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DashBoard()));
                    },
              child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                         color: Colors.white
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      margin: EdgeInsets.only(right: 30,bottom: 30),
                      child: Text(butName,style: TextStyle(color: Colors.white,fontSize: 16),),
                    ),
                  )
                ),
              )
      ],
    );
  }
}