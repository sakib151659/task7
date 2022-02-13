import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'firstScreen.dart';
import 'forgetPass.dart';

class ForgetPassSuccess extends StatefulWidget { 
  const ForgetPassSuccess({Key? key}) : super(key: key);

  @override
  _ForgetPassSuccessState createState() => _ForgetPassSuccessState();
}

class _ForgetPassSuccessState extends State<ForgetPassSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Image.asset('assets/icons/success.png',height: 250,),
                //SizedBox(height: 30,),
                Text("Success", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 20,),
                Text("Please check your email to create", style: TextStyle(
                  fontSize: 17,
                ),
                ),
                Text("new password", style: TextStyle(
                  fontSize: 17,
                ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("cant get email ", style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),),
                    InkWell(
                      child: Text("Resubmit", style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ForgetPass() ));
                      },
                    )
                  ],
                ),

                SizedBox(height: 100,),

                SizedBox(
                  width: 220,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstScreen()));

                  },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#32B768"),
                      ),
                      child: const Text("Back Email")),
                )


              ],
            ),
          ),

        ],
      ),
    );
  }
}
