import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../shared/textInputDecoration.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String password = '';
  String error = '';
  String email = '';
  bool passwordIcon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    const Text("Full Name"),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        decoration:textInputDecoration.copyWith(
                          hintText: 'Username',
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey), ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (val) => val!.isEmpty? 'Enter an user Name' : null ,
                        onChanged: (val){
                          setState(()=> userName = val);

                        }
                    ),

                    const SizedBox(height: 20.0),
                    const Text("Email Address"),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        decoration:textInputDecoration.copyWith(
                          hintText: 'Ex. sakibkhan@gmail.com',
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey), ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val!.isEmpty? 'Enter an Valid Email' : null ,
                        onChanged: (val){
                          setState(()=> email= val);

                        }
                    ),


                    SizedBox(height: 20.0),
                    const Text("Password"),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        decoration:textInputDecoration.copyWith(
                            hintText: 'Password',
                            border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey), ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),

                        ),

                        obscureText: true,
                        validator: (val) => val!.length < 6 ? 'Enter at lest 6 digit password' : null ,
                        onChanged: (val){
                          setState(()=> password = val);

                        }
                    ),

                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: HexColor("#F4F4F4"),
                              ),
                              child: const Text('Registration',
                                style: TextStyle(color: Colors.grey, fontSize: 17.0, ),

                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).pop();
                                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage() ));
                                }

                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor("#F4F4F4"),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('assets/icons/google.png'),
                                    SizedBox(width: 20,),
                                    const Text('Sign Up with Google',
                                      style: TextStyle(color: Colors.black, fontSize: 17.0, fontWeight: FontWeight.w300 ),
                                    ),
                                  ],
                                ),

                                onPressed: () {
                                  Navigator.of(context).pop();
                                  //Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage() ));
                                }

                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
