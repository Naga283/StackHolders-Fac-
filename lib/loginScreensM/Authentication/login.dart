import 'package:flutter/material.dart';
import 'package:hackthon/loginScreensM/Authentication/otpScreen.dart';
import 'package:hackthon/loginScreensM/Authentication/signup.dart';
import 'package:hackthon/Dashboard/dashboard.dart';
import 'package:hackthon/styles/bottomImage.dart';


import 'authentication.dart';



class LoginM extends StatefulWidget {
  @override
  State<LoginM> createState() => _LoginMState();
}

class _LoginMState extends State<LoginM> {
  final _formKey = GlobalKey<FormState>();

  String? email;

  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
     

    return Scaffold(
      body: ListView(
        // padding: EdgeInsets.all(8.0),
        children: <Widget>[
        
          // logo
          Column(
            children: [
              SizedBox(
                width: double.infinity,
              
                
                child: Image.asset("assests/images/cropetop .png",)),
              // FlutterLogo(
              //   size: 55,
              // ),
              SizedBox(height: 50),
              Text(
                'Welcome back!',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),

          SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
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
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

        
        ],
      ),
    ),
          ),
  Container(
    margin: EdgeInsets.only(right: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Forgot Password?",style: TextStyle(color: Colors.blue),),
      ],
    ),
  ),
          // SizedBox(height: 20),

         
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

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
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
                      )
                      );
                    }
                  });
                }
                        
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OTPAuth(email: '', pass: '',)));
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
                        child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),),
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
              Text('New Here?',
                  style: TextStyle( fontSize: 16,color: Colors.white)),
              GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/signup');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: Text('Register',
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
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);
  

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
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
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

        
        ],
      ),
    );
  }
}
