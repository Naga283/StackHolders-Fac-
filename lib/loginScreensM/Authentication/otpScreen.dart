import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../Dashboard/dashboard.dart';
import '../../styles/bottomImage.dart';
import 'authentication.dart';

class OTPAuth extends StatefulWidget {
  const OTPAuth({ Key? key, required this.email, required this.pass }) : super(key: key);
final String email;
final String pass;
  @override
  State<OTPAuth> createState() => _OTPAuthState();
}

class _OTPAuthState extends State<OTPAuth> {
  final TextEditingController _otpcontroller = TextEditingController();
  //final OtpFieldController _otpcontroller = OtpFieldController();

  // Declare the object
  late EmailAuth emailAuth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
  }
   verify() {
    print(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.toString()));
  }
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      body: ListView(
        
        children: [
          SizedBox(height: 30,),
          TextField(
controller: _otpcontroller,
          ),
          OutlineButton(onPressed: (){
            verify();
            print("Verifff");
            print(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text));
            print("ended");
            if(emailAuth.validateOtp(
        recipientMail: widget.email.toString(),
        userOtp: _otpcontroller.value.text)== true){
AuthenticationHelper()
                      .signUp(email: widget.email, password: widget.pass)
                      .then((result) {
                        
                    if (result == null) {
                      
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
            }
            else{
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Please enter correct OTP",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
              print("INvalid ");
            }
             
            print("Verifying Here");
            print(_otpcontroller.text);
          },child: Text("Verify"),)
  //  Image.asset("assests/images/cropetop.png",),
       
  //      Text("OTP",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
  //      Center(
  //       child: OTPTextField(
  //           controller: _otpcontroller,
  //           length: 6,
  //           width: MediaQuery.of(context).size.width,
  //           textFieldAlignment: MainAxisAlignment.spaceAround,
  //           fieldWidth: 55,
  //           fieldStyle: FieldStyle.box,
  //           outlineBorderRadius: 15,
  //           style: TextStyle(fontSize: 17),
  //           onChanged: (pin) {
  //             print("Changed: " + pin);
  //           },
  //           onCompleted: (pin) {
  //             print("Completed: " + pin);

  //           }),
  //     ),
       
  //       SizedBox(
  //         height: MediaQuery.of(context).size.height *0.45,
  //         child: BottomImage(butName: 'Verify',))
        ],
      ),
    );
  }
}