import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../home/home.dart';
import '../shared/textInputDecoration.dart';
 class Login extends StatefulWidget {
   const Login({Key? key}) : super(key: key);

   @override
   _LoginState createState() => _LoginState();
 }

 class _LoginState extends State<Login> {
   final _formKey = GlobalKey<FormState>();
   String userName = '';
   String password = '';
   String error = '';
   String email = '';
   bool passwordIcon = true;
   bool isValidet = false;
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passController = TextEditingController();

   @override
   void initState() {
     super.initState();
     _emailController.addListener(() {
       setState(() {}); // setState every time text changes
     });

     _passController.addListener(() {
       setState(() {}); // setState every time text changes
     });
   }

   @override
   void dispose() {
     _emailController.dispose();
     _passController.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
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


                     SizedBox(height: 20.0),
                     const Text("Password"),
                     const SizedBox(height: 20.0),
                     TextFormField(
                         controller: _passController,
                         decoration:textInputDecoration.copyWith(
                           hintText: 'Password',
                         ),

                         obscureText: true,
                         validator: (val) => val!.isValidPass() ? null  : 'Enter minimum eight characters, at least 1 letter and 1 number',
                         onChanged: (val){
                           setState(()=> password = val);

                         }
                     ),
                     SizedBox(height: 10.0),

                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Container(),
                         InkWell(
                           child: const Text("Forget Password?",
                             style: TextStyle(color: Colors.green),
                           ),
                           onTap: (){

                           },
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
                                 //primary: HexColor("#F4F4F4"),
                                 primary: (_passController.text.length<8  || !_emailController.text.contains('@') || !_emailController.text.endsWith(".com")) ? HexColor("#F4F4F4") : Colors.green,
                               ),
                               child: Text('Login',
                                 style: TextStyle(color: (_passController.text.length<8  || !_emailController.text.contains('@') || !_emailController.text.endsWith(".com")) ? Colors.grey : Colors.white, fontSize: 17.0, ),

                               ),
                               onPressed: () {
                                 if (_formKey.currentState!.validate()) {
                                   Navigator.of(context).pop();
                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage() ));
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
                                     const Text('Login with Google',
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


extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PassValidator on String {
  bool isValidPass() {
    return RegExp(
        r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
        .hasMatch(this);
  }
}

