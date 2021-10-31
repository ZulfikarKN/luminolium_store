
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:luminolium_store/login_screen.dart';
import 'data.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key : key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late final User? user;
  final AuthenticationService _auth = AuthenticationService(FirebaseAuth.instance);

  File? _image;
  String? photoUrl;
  final picker = ImagePicker();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light, // not working
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light, // works
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          backgroundColor: Colors.black,
          leading: Builder(
            builder: (context){
              return IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white,),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              );
            },
          ),
          title: Text('Sign Up',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'LemonMilk',
              color: Colors.white),),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
              key: _formkey,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(60),
                              child:CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.white,
                                child: (_image != null) ?
                                  CircleAvatar(
                                    radius: 58,
                                    backgroundImage: FileImage(_image!),
                                  ) :
                                  CircleAvatar(
                                    radius: 58,
                                    backgroundColor: Colors.black45,
                                    backgroundImage: NetworkImage('https://robohash.org/zaburazuka'),
                                  ),
                              ),
                              onTap: pickImage,
                              ),
                            ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                              controller: _displayNameController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'Enter your Name...',
                                hintStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white12,
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                              height: 30
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                              controller: _emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'Enter your email...',
                                hintStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white12,
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText: 'Enter your password...',
                                hintStyle: TextStyle(color: Colors.white),
                                filled: true,
                                fillColor: Colors.white12,
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                              ),
                              onPressed: () async {
                                if (_image != null) {await uploadtask();}
                                  if (_formkey.currentState!.validate()) {
                                    await _auth.signUp(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim());
                                  if (photoUrl != null) {
                                    await _auth.updateProfile(
                                      photoURL: photoUrl,
                                      displayName:
                                          _displayNameController.text.trim(),
                                    );
                                  } else {
                                    await _auth.updateProfile(
                                      photoURL:
                                          'https://robohash.org/lokilakai',
                                      displayName:
                                          _displayNameController.text.trim()
                                    );
                                  }
                                } await _auth.signOut();
                              },
                              child: const Text('Submit',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ),
        ),
      ),
    );
  }
  Future pickImage({ImageSource? source}) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });

  }
  Future uploadtask() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref('profilePicture').child("image" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_image!);
    uploadTask.then((res) {
      res.ref.getDownloadURL()
          .then((value) => {
            photoUrl = value
      });
    });
  }
}