import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task7/authenticate/login.dart';

import 'package:task7/authenticate/signUp.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50,),
              Image.asset('assets/images/first.png', height: 400, ),
              const Text("Welcome", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),),
              const Text("Before Enjoying Food Media services", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
              const Text("Please register First", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),

              SizedBox(height: 20,),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        showBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            context: context,
                            builder: (context) => Container(
                              height: 600,

                              child: Container(
                                  decoration:  BoxDecoration(
                                      color: HexColor("#FFFFFF"),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],

                                  ),
                                  child: Container(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                                      SizedBox(height: 20.0),
                                      Image.asset('assets/icons/line.png',width: 30,),
                                      DefaultTabController(
                                          length: 2, // length of tabs
                                          initialIndex: 0,
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                                            Container(
                                              child: TabBar(
                                                labelColor: HexColor("#32B768"),
                                                indicatorColor: HexColor("#32B768"),
                                                unselectedLabelColor: HexColor("#89909E"),
                                                tabs: const [
                                                  Tab(text: 'Create Account'),
                                                  Tab(text: 'Login'),
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 450, //height of TabBarView
                                                decoration: const BoxDecoration(
                                                    border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                                                ),
                                                child: const TabBarView(children: <Widget>[
                                                  SignUp(),
                                                  Login(),
                                                ])
                                            )
                                          ])
                                      ),
                                    ]),
                                  ),
                              ),
                            )
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#32B768"),
                      ),
                      child: const Text("Create Account")
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        primary: HexColor("#D1FAE5"),
                      ),
                      child: const Text("Login", style: TextStyle(color: Colors.green),)
                  ),
                ),
              ),

              const SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FittedBox(
                  child: Row(
                    children: <Widget>[
                      const Text("By Logging in or Registering, You have Agreed To "),

                      InkWell(
                          child: const Text("The terms ands Conditions", style: TextStyle(color: Colors.green),
                          ),
                        onTap: (){

                        },
                      ),
                    ],
                  ),
                ),
              )

            ],
          );
        }
      ),



    );
  }
}
