// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:grocery/helper/hellper.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/Bloc/Authontication/authontication_bloc.dart';
import 'package:grocery/Bloc/Sign_in_up/sign_in_up_bloc.dart';
import 'package:grocery/widget/Phone_TextFilld.dart';
import 'package:grocery/widget/SnecBarCard.dart';
import 'package:grocery/widget/TextFildCard.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:grocery/globals.dart' as globals;

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
  ButtonState stateTextWithIcon = ButtonState.idle;
  ButtonState stateTextWith = ButtonState.idle;

  bool chack = true;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.initDynamicLinks(context);
  }

  @override
  Widget build(BuildContext context) {
    double theight = MediaQuery.of(context).size.height;
    print(",,,,,,,,,,,,,,,,,${globals.manufacturer}");
    AuthonticationBloc a = BlocProvider.of<AuthonticationBloc>(context);
    SignInUpBloc u = BlocProvider.of<SignInUpBloc>(context);
    u.add(Get_SignUp(
        pass1: "false", pass2: 'false', temConditionSignup: 'false'));

    return BlocListener<AuthonticationBloc, AuthonticationState>(
      listener: (context, state1) {
        if (state1 is UpdateUserData) {
          // stateTextWithIcon = ButtonState.success;
          print("kkkkkkkkkkkkkkkkkkkkk,,,,,,,,,,,,,,,");
          Navigator.of(context).pushReplacementNamed('SetLocation');
        } else if (state1 is SignUpFaill) {
          // stateTextWithIcon = ButtonState.fail;
          print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy${state1.error.toString()}");
          showSnackBar(context, state1.error);
        } else if (state1 is LodingData) {
          // stateTextWithIcon = ButtonState.loading;
        }
      },
      child: Scaffold(
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
                                      callback: firstName,
                                    ),
                                    Divider(),
                                    TextFildCard(
                                      Icon(
                                        Icons.account_circle_outlined,
                                        color: Colors.black26,
                                      ),
                                      "Last Name",
                                      lastname,
                                      callback: lastName,
                                    ),
                                    Phone_TextFilld(
                                      mobilno,
                                      suflix: buildTextWithIcon(
                                          u,
                                          state.stateText!,
                                          "phone",
                                          mobilno,
                                          theight),
                                    ),
                                    Divider(),
                                    TextFildCard(
                                      Icon(
                                        Icons.email_outlined,
                                        color: Colors.black26,
                                      ),
                                      "E-mail",
                                      email,
                                      sufix: buildTextWithIcon(
                                          u,
                                          state.buttonState2!,
                                          "email",
                                          email,
                                          theight),
                                      callback: emailValidator,
                                    ),
                                    Divider(),
                                    TextFildCard(
                                      Icon(Icons.lock_outline),
                                      "Password",
                                      password,
                                      isPassword: state.pass1,
                                      callback: passwordValidator,
                                      sufix: state.pass1
                                          ? InkWell(
                                              onTap: () {
                                                u.add(
                                                    Get_SignUp(pass1: "true"));
                                              },
                                              child: Icon(
                                                  Icons.visibility_outlined))
                                          : InkWell(
                                              onTap: () {
                                                u.add(
                                                    Get_SignUp(pass1: "true"));
                                              },
                                              child: Icon(Icons
                                                  .visibility_off_outlined)),
                                    ),
                                    Divider(),
                                    TextFildCard(
                                      Icon(Icons.lock_outline),
                                      "Confirm Password",
                                      conformpassword,
                                      isPassword: state.pass2,
                                      callback: confirmPasswordValidator,
                                      sufix: state.pass2
                                          ? InkWell(
                                              onTap: () {
                                                u.add(
                                                    Get_SignUp(pass2: "true"));
                                              },
                                              child: Icon(
                                                  Icons.visibility_outlined))
                                          : InkWell(
                                              onTap: () {
                                                u.add(
                                                    Get_SignUp(pass2: "true"));
                                              },
                                              child: Icon(Icons
                                                  .visibility_off_outlined)),
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
                                  Text('I agree with '),
                                  Text(
                                    'Trems & Conditions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
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
                                  // buildTextWithIcon(a)
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        if (state.temConditionSignup) {
                                          if (_key.currentState!.validate()) {
                                            // signUpUser(context);
                                            // buildTextWithIcon(a);
                                            // a.add(

                                            // );
                                          }
                                        }
                                      },
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
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
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextWithIcon(SignInUpBloc u, ButtonState stateText, String name,
      TextEditingController controller, double theight) {
    // print("//////////////////////${stateText}");
    // u.add(Get_SignUp(stateText: ButtonState.loading));
    return ProgressButton(
      progressIndicator: CircularProgressIndicator(
        color: Colors.green,
        strokeWidth: 2,
      ),
      progressIndicatorAlignment: MainAxisAlignment.center,
      progressIndicatorSize: 20,
      minWidth: 50,
      maxWidth: 50,
      height: 20,
      stateColors: {
        ButtonState.idle: Colors.white,
        ButtonState.loading: Colors.white,
        ButtonState.fail: Colors.white,
        ButtonState.success: Colors.white
      },
      stateWidgets: {
        ButtonState.idle: Text(
          "Verify",
          style: TextStyle(color: Colors.green),
        ),
        ButtonState.loading: SizedBox.shrink(),
        ButtonState.fail: Icon(Icons.error_outline_outlined),
        ButtonState.success: Icon(
          Icons.check_circle,
          color: Colors.green,
        )
      },
      onPressed: () {
        print("/111111111111111111111111111111111111");
        if (name == "phone") {
          String otp = "";
          Helpper().showOtpDilog(
            theight,
            context,
          );
          u.add(Get_SignUp(stateText1: ButtonState.loading));
          u.add(PhoneAuth(phone: controller.text, name: name));
        }

        if (name == "email") {
          u.add(Get_SignUp(stateText2: ButtonState.loading));
          u.add(EmailAuth(controller.text));
        }

        // stateText = state.stateText;
        // setState(() {});
        // a.add(
        //   GetUser(
        //     email: email.text,
        //     password: password.text,
        //     firstname: firstname.text,
        //     lastname: lastname.text,
        //     mobilno: mobilno.text,
        //     // modalName: ,
        //     // deviceName:
        //     //     value.deviceName,
        //     // hardWere: value.hardware,
        //   ),
        // );
      },
      state: stateText,
    );
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty || value == "") {
      return "This Feild is required";
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value!.isEmpty || value == "") {
      return "This Feild is required";
    }
    if (password.text != value) {
      return "Please Enter same password";
    }
    return null;
  }

  String? firstName(String? value) {
    if (value!.isEmpty || value == "") {
      return "This Feild is required";
    }
    final alphabatic = RegExp(r'^[a-zA-Z ]+$');
    if (!alphabatic.hasMatch(value)) {
      return "Name Must be Alphabatic";
    }
    return null;
  }

  String? lastName(String? value) {
    if (value!.isEmpty || value == "") {
      return "This Feild is required";
    }
    final alphabatic = RegExp(r'^[a-zA-Z ]+$');
    if (!alphabatic.hasMatch(value)) {
      return "Name Must be Alphabatic";
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value!.isEmpty || value == "") {
      return "This Feild is required";
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty || value == "") {
      return "This Feild is required";
    }
    return null;
  }

  Future<void> showSnackBar(BuildContext contex, String msg) async {
    final snackBar = SnackBar(
      content: Text(msg),
      // duration: Duration(seconds: 6),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  initDynamicLinks(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    var data = await FirebaseDynamicLinks.instance.getInitialLink();
    final deepLink = data?.link;
    final queryParams = deepLink?.queryParameters ?? {};
    print("+====================${queryParams}");
    if (queryParams.length > 0) {
      Navigator.pushNamed(context, "Dashbord");
      print(
          "llllllllllllllllllllll99999999999999999999999${data?.link}99${data?.utmParameters}");
      var userName = queryParams['userId'];
    }
    FirebaseDynamicLinks.instance.onLink.listen((event) {});

    // (onSuccess: (dynamicLink)
    // async {
    //   var deepLink = dynamicLink?.link;
    //   debugPrint('DynamicLinks onLink $deepLink');
    // }, onError: (e) async {
    //   debugPrint('DynamicLinks onError $e');
    // });
  }
}
