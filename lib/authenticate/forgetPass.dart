import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task7/authenticate/login.dart';
import '../shared/textInputDecoration.dart';
import 'firstScreen.dart';
import 'forgetPassSuccess.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String password = '';
  String error = '';
  String email = '';
  bool passwordIcon = true;
  bool isValidet = false;
  TextEditingController _emailController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80,),
              const Text("Forget Password", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              const SizedBox(height: 10,),
              const Text("Enter your registered email below", style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              ),

              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 70.0),
                    const Text("Email Address"),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        controller: _emailController,
                        decoration:textInputDecoration.copyWith(
                          hintText: 'Ex. sakibkhan@gmail.com',

                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) => val!.isValidEmail() ? null : 'Enter an Valid Email' ,
                        onChanged: (val){
                          setState(()=> email= val);

                        }
                    ),

                    SizedBox(height: 10.0),

                    Row(

                      children: <Widget>[
                        Text("Remember the password?  "),
                        InkWell(
                          child: const Text("Sign In",
                            style: TextStyle(color: Colors.green),
                          ),
                          onTap: (){
                            //Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen() ));
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 300.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                //primary: HexColor("#F4F4F4"),
                                primary: (!_emailController.text.contains('@') || !_emailController.text.endsWith(".com")) ? HexColor("#F4F4F4") : Colors.green,
                              ),
                              child: Text('Submit',
                                style: TextStyle(color: (!_emailController.text.contains('@') || !_emailController.text.endsWith(".com")) ? Colors.grey : Colors.white, fontSize: 17.0, ),

                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassSuccess() ));

                                }

                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 60,),
                    Container(),

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
