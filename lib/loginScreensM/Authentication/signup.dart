import 'package:email_auth/email_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hackthon/loginScreensM/Authentication/login.dart';
import 'package:hackthon/loginScreensM/Authentication/spocLetter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'authentication.dart';
import 'otpScreen.dart';



class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
   final _formKey = GlobalKey<FormState>();

  String? email;
  String? phone;
  String? password;
  String? name;
  bool _obscureText = false;
  bool submitValid = false;
  bool agree = false;
 late EmailAuth emailAuth;
  final pass = new TextEditingController();
   @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    //emailAuth.config(remoteServerConfiguration);
  }
   void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email.toString(), otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    var space = SizedBox(height: 10);
    return Scaffold(
      body: ListView(
        
        children: <Widget>[
         Image.asset("assests/images/lightTop.png",),
          // logo
          // Column(
          //   children: [
          //     FlutterLogo(
          //       size: 55,
          //     ),
          //   ],
          // ),
        
          Text(
            'Register',
            style: TextStyle(fontSize: 24),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child:Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.account_circle),
              border: border,
            ),
            onSaved: (val) {
              name = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
          ),
          space,
          // email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
              print(email); 
            },
            keyboardType: TextInputType.emailAddress,
          ),

          space,
          // Phone Number
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phone Number',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Your Phone Number';
              }
              return null;
            },
            onSaved: (val) {
              phone = val;
              print(phone); 
            },
            keyboardType: TextInputType.phone,
          ),
          space,
          // Code
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box_rounded),
                labelText: 'AISHE CODE',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Your Phone Number';
              }
              return null;
            },
            onSaved: (val) {
              phone = val;
              print(phone); 
            },
            keyboardType: TextInputType.phone,
          ),
          space,
          Row(
            children: [
              Text("To Know AISHE Current Application   ",style: TextStyle(color: Colors.red),),
              RichText(
              text: TextSpan(
                  text: "Click Here",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url = 'https://aishe.gov.in/aishe/aisheCode';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
            ),
            ],
          ),
          
          space,
          //Spoc Letter
          SpocLetter(),
          space,
          
          Text("Click Here to Expert LETTER FORMAT",style: TextStyle(color: Colors.red),),
          space,
          //Profession
         
          // password
          TextFormField(
            controller: pass,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            onSaved: (val) {
              password = val;
            },
            obscureText: !_obscureText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          space,
          // confirm passwords
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
            ),
            obscureText: true,
            validator: (value) {
              if (value != pass.text) {
                return 'password not match';
              }
              return null;
            },
          ),
          space,
          // name
          

          Row(
            children: <Widget>[
              Checkbox(
                onChanged: (_) {
                  setState(() {
                    agree = !agree;
                  });
                },
                value: agree,
              ),
              Flexible(
                child: Text(
                    'By creating account, I agree to Terms & Conditions and Privacy Policy.'),
              ),
            ],
          ),
         

        
        ],
      ),
    ),
          ),

     
          SizedBox(
            height: MediaQuery.of(context).size.height *0.29,
            child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  
                  
            Image.asset("assests/images/bottom.PNG"),
            
               // ignore: unnecessary_new
               new Align(
                 alignment: FractionalOffset.bottomRight,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(
                        16
                    ),
                    child: GestureDetector(
                      onTap: (){
                        
                          if (_formKey.currentState!.validate()) {
                 _formKey.currentState!.save();
                  sendOtp();
                   Navigator.pushReplacement(context,
                           MaterialPageRoute(builder: (context) => OTPAuth(email: email.toString(), pass: password.toString(),)));
                  
                  // AuthenticationHelper()
                  //     .signUp(email: email!, password: password!)
                  //     .then((result) {
                        
                  //   if (result == null) {
                      
                  //     Navigator.pushReplacement(context,
                  //         MaterialPageRoute(builder: (context) => FirstScreen()));
                  //   } else {
                  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text(
                  //         result,
                  //         style: TextStyle(fontSize: 16),
                  //       ),
                  //     ));
                  //   }
                  // });
                   
                   print(email);
                }
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
                        child: Text("Register",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ),
                    )
                  ),
                ),
                  // ignore: unnecessary_new
                  new Align(
                 alignment: FractionalOffset.bottomLeft,
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(
                        16
                    ),
                    child: GestureDetector(
                      onTap: (){
                        
                       // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                      },
                child: Container(
                       margin: EdgeInsets.only(bottom: 30),
                        child:  Row(
            children: <Widget>[
              SizedBox(width: 30),
              
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginM()));
                },
                child: Text('Already Member?',
                    style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold)),
              )
            ],
          ),
                      ),
                    )
                  ),
                )
                ],
              ),
          )],
      ),
    );
  }

  Container buildLogo() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.blue),
      child: Center(
        child: Text(
          "",
          style: TextStyle(color: Colors.white, fontSize: 60.0),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? phone;
  String? password;
  String? name;
  bool _obscureText = false;
  bool submitValid = false;
  bool agree = false;
 late EmailAuth emailAuth;
  final pass = new TextEditingController();
   @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );

    /// Configuring the remote server
    //emailAuth.config(remoteServerConfiguration);
  }
   void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: email.toString(), otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(100.0),
      ),
    );

    var space = SizedBox(height: 10);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full name',
              prefixIcon: Icon(Icons.account_circle),
              border: border,
            ),
            onSaved: (val) {
              name = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some name';
              }
              return null;
            },
          ),
          space,
          // email
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
              print(email); 
            },
            keyboardType: TextInputType.emailAddress,
          ),

          space,
          // Phone Number
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Phone Number',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Your Phone Number';
              }
              return null;
            },
            onSaved: (val) {
              phone = val;
              print(phone); 
            },
            keyboardType: TextInputType.phone,
          ),
          space,
          // Code
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_box_rounded),
                labelText: 'AISHE CODE',
                border: border),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter Your Phone Number';
              }
              return null;
            },
            onSaved: (val) {
              phone = val;
              print(phone); 
            },
            keyboardType: TextInputType.phone,
          ),
          space,
          Row(
            children: [
              Text("To Know AISHE Current Application   ",style: TextStyle(color: Colors.red),),
              RichText(
              text: TextSpan(
                  text: "Click Here",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url = 'https://aishe.gov.in/aishe/aisheCode';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
            ),
            ],
          ),
          
          space,
          //Spoc Letter
          SpocLetter(),
          space,
          
          Text("Click Here to SPOC LETTER FORMAT",style: TextStyle(color: Colors.red),),
          space,
          // password
          TextFormField(
            controller: pass,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            onSaved: (val) {
              password = val;
            },
            obscureText: !_obscureText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          space,
          // confirm passwords
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: border,
            ),
            obscureText: true,
            validator: (value) {
              if (value != pass.text) {
                return 'password not match';
              }
              return null;
            },
          ),
          space,
          // name
          

          Row(
            children: <Widget>[
              Checkbox(
                onChanged: (_) {
                  setState(() {
                    agree = !agree;
                  });
                },
                value: agree,
              ),
              Flexible(
                child: Text(
                    'By creating account, I agree to Terms & Conditions and Privacy Policy.'),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          // signUP button
          SizedBox(
            height: 50,
            width: double.infinity,
            // child: ElevatedButton(
            //   onPressed: () {
            //     if (_formKey.currentState!.validate()) {
            //      _formKey.currentState!.save();
            //       sendOtp();
            //        Navigator.pushReplacement(context,
            //                MaterialPageRoute(builder: (context) => OTPAuth(email: email.toString(), pass: password.toString(),)));
                  
            //       // AuthenticationHelper()
            //       //     .signUp(email: email!, password: password!)
            //       //     .then((result) {
                        
            //       //   if (result == null) {
                      
            //       //     Navigator.pushReplacement(context,
            //       //         MaterialPageRoute(builder: (context) => FirstScreen()));
            //       //   } else {
            //       //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //       //       content: Text(
            //       //         result,
            //       //         style: TextStyle(fontSize: 16),
            //       //       ),
            //       //     ));
            //       //   }
            //       // });
                   
            //        print(email);
            //     }
            //   },
            //   style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(24.0)))),
            //   child: Text('Sign Up'),
            // ),
          ),
        ],
      ),
    );
  }
}
