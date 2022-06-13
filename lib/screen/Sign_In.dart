// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Sign_in_up/sign_in_up_bloc.dart';
import 'package:grocery/widget/Phone_TextFilld.dart';
import 'package:grocery/widget/TextFildCard.dart';

class Sign_In extends StatefulWidget {
  Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String countryCode = "";
  @override
  Widget build(BuildContext context) {
    SignInUpBloc s = BlocProvider.of<SignInUpBloc>(context);
    Size size = MediaQuery.of(context).size;
    s.add(Get_SignIn(pass: "false", remember: 'false', temCondition: 'true'));
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Form(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/logo.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height:,
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<SignInUpBloc, SignInUpState>(
                  builder: (context, state) {
                    if (state is ShowSignIn) {
                      print(state.remember);
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                // Phone_TextFilld(mobilno,),
                                TextFildCard(
                                    Icon(Icons.email_outlined), "Email", email),
                                TextFildCard(
                                  Icon(Icons.lock_outline),
                                  "Password",
                                  password,
                                  isPassword: state.pass,
                                  sufix: state.pass
                                      ? InkWell(
                                          onTap: () {
                                            s.add(Get_SignIn(
                                                pass: 'true',
                                                remember: 'state.remember'));
                                          },
                                          child:
                                              Icon(Icons.visibility_outlined))
                                      : InkWell(
                                          onTap: () {
                                            s.add(
                                              Get_SignIn(
                                                  pass: 'true',
                                                  remember: 'state.remember'),
                                            );
                                          },
                                          child: Icon(
                                              Icons.visibility_off_outlined),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.5,
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    s.add(Get_SignIn(remember: 'true'));
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                          value: state.remember,
                                          onChanged: (value) {}),
                                      Text("Remember me")
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, 'ForgotPassword'),
                                  child: Text(
                                    "Forgot password",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.green,
                                  value: state.tarnCondition,
                                  onChanged: (value) {
                                    s.add(Get_SignIn(temCondition: 'true'));
                                  }),
                              Text("I agree with "),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Terms & Condition",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, 'SignUP');
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(left: 8),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    s.add(Signin(email.text, password.text));
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: state.tarnCondition
                                          ? Colors.green
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    margin: EdgeInsets.only(right: 8),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, "Dashbord");
                            },
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Continue as ',
                                    style: TextStyle(color: Colors.black26),
                                  ),
                                  TextSpan(
                                    text: 'Guest',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                  },
                  listener: (context, state) {})
            ],
          ),
        )),
      )),
    );
  }
}
