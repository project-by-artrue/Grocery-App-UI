// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Sign_in_up/sign_in_up_bloc.dart';
import 'package:grocery/widget/Phone_TextFilld.dart';
import 'package:grocery/widget/TextFildCard.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUP extends StatefulWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobilno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conformpassword = TextEditingController();

  bool chack = true;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SignInUpBloc u = BlocProvider.of<SignInUpBloc>(context);
    u.add(
        Get_SignUp(pass1: "false", pass2: 'false', temConditionSignup: 'true'));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
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
                    "SIGN UP",
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
                      print("...........................${state}");
                      if (state is ShowSignUp) {
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  TextFildCard(
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.black26,
                                    ),
                                    "First Name",
                                    firstname,
                                  ),
                                  Divider(),
                                  TextFildCard(
                                    Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.black26,
                                    ),
                                    "Last Name",
                                    lastname,
                                  ),
                                  Phone_TextFilld(mobilno),
                                  Divider(),
                                  TextFildCard(
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.black26,
                                    ),
                                    "E-mail",
                                    email,
                                  ),
                                  Divider(),
                                  TextFildCard(
                                    Icon(Icons.lock_outline),
                                    "Password",
                                    password,
                                    isPassword: state.pass1,
                                    sufix: state.pass1
                                        ? InkWell(
                                            onTap: () {
                                              u.add(Get_SignUp(pass1: "true"));
                                            },
                                            child:
                                                Icon(Icons.visibility_outlined))
                                        : InkWell(
                                            onTap: () {
                                              u.add(Get_SignUp(pass1: "true"));
                                            },
                                            child: Icon(
                                                Icons.visibility_off_outlined)),
                                  ),
                                  Divider(),
                                  TextFildCard(
                                    Icon(Icons.lock_outline),
                                    "Confirm Password",
                                    password,
                                    isPassword: state.pass2,
                                    sufix: state.pass2
                                        ? InkWell(
                                            onTap: () {
                                              u.add(Get_SignUp(pass2: "true"));
                                            },
                                            child:
                                                Icon(Icons.visibility_outlined))
                                        : InkWell(
                                            onTap: () {
                                              u.add(Get_SignUp(pass2: "true"));
                                            },
                                            child: Icon(
                                                Icons.visibility_off_outlined)),
                                  ),
                                  Divider(),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  activeColor: Colors.green,
                                  onChanged: (value) {
                                    setState(() {
                                      u.add(Get_SignUp(
                                          temConditionSignup: 'true'));
                                    });
                                  },
                                  value: state.temConditionSignup,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'I agree with '),
                                      TextSpan(
                                        onEnter: (event) {},
                                        text: 'Trems & Conditions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                    ],
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
                                          context, 'Sign_In');
                                    },
                                    child: Container(
                                      height: 50,
                                      margin: EdgeInsets.only(left: 8),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Sign In",
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
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(right: 8),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: state.temConditionSignup
                                          ? Colors.green
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                    listener: (context, state) {}),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "Dashbord");
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
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
