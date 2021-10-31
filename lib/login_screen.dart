import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:luminolium_store/data.dart';
import 'signup_screen.dart';
import 'data.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _secureText = true;
  final AuthenticationService _auth = AuthenticationService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                      padding: EdgeInsets.only(top: 6),
                        child:
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 15.0,),
                                Image.asset('images/decoration/logo2.png',
                                  width: 130,),
                              Text("LUMINOLIUM",
                                style: TextStyle(
                                  fontFamily: 'LemonMilk' ,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.0,),
                              )
                              ]
                            )
                          ),
                          ),
                    ],
                ),
              ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          Container(
                           height: 50,
                            child: TextField(
                              controller: emailController,
                              style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.email, color: Colors.white,),
                                    filled: true,
                                    fillColor: Colors.white12,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          ),
                          Container(
                            height: 50,
                            child: TextField(
                              controller: passwordController,
                              obscureText: _secureText,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.lock_open, color: Colors.white,),
                                filled: true,
                                fillColor: Colors.white12,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _secureText ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined, color: Colors.white,),
                                  onPressed: (){
                                    setState(() {
                                      _secureText = !_secureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () {
                                        setState(() {
                                          _auth.signIn(
                                            email: emailController.text.trim(),
                                            password: passwordController.text.trim(),
                                          );
                                        });
                                  },
                                    child:
                                    Text('Login',
                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        )
                                      )
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            child: RichText(text: TextSpan(
                              text: 'Didn\'t have an account yet? ',
                              style: TextStyle(color: Colors.white, fontSize: 15.0),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sign Up.',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () { Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => SignUpScreen()),
                                      );
                                      },
                                    style: TextStyle(color: Colors.lightBlue, fontSize: 15.0),),
                              ]
                            ),)
                          )
                        ],
                      ),
                    ),
                ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}