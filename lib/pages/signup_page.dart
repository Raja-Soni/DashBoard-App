import 'package:dashboard_app/custom_widgets/custom_button.dart';
import 'package:dashboard_app/custom_widgets/custom_text.dart';
import 'package:dashboard_app/main.dart';
import 'package:dashboard_app/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../custom_widgets/custom_input_text_field.dart';
import '../firebase_auth_functions/authenticate_users.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  String givenName = "";
  String givenEmail = "";
  String? givenPassword;
  final singUpFormKey = GlobalKey<FormState>();

  String getName(String str) {
    return str.split("@").first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.blue.shade800,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: CustomText(
                  textSize: 40,
                  text: "Sign Up",
                  textBoldness: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: singUpFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 50.0),
                    child: CustomText(
                      text: "Create Account",
                      textBoldness: FontWeight.bold,
                      textColor: Colors.black,
                      textSize: 45,
                    ),
                  ),
                  CustomFormTextField(
                    hintText: 'Name',
                    inputType: TextInputType.name,
                    icon: Icon(Icons.person_2_outlined),
                    validate: (String? value) {
                      final numRegex = RegExp(r'^[^0-9]+$');
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Email";
                      } else if (!numRegex.hasMatch(value)) {
                        return "Numbers are not allowed";
                      }
                      return null;
                    },
                    savedValue: (String? value) {
                      givenName = value.toString().trim();
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomFormTextField(
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                    icon: Icon(Icons.email_outlined),
                    validate: (String? value) {
                      final emailRegex = RegExp(
                        r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Email";
                      } else if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    savedValue: (String? value) {
                      givenEmail = value.toString().trim();
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  CustomFormTextField(
                    hintText: 'Password',
                    inputType: TextInputType.visiblePassword,
                    icon: Icon(Icons.password_outlined),
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your Password";
                      } else if (value.length <= 5) {
                        return "Password must be more than 5 characters";
                      }
                      return null;
                    },
                    savedValue: (String? value) {
                      givenPassword = value.toString().trim();
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  CustomButton(
                    buttonText: "Sign Up",
                    callback: () {
                      bool isValidate = singUpFormKey.currentState!.validate();
                      if (isValidate) {
                        singUpFormKey.currentState!.save();
                        String name =
                            givenName[0].toUpperCase() +
                            givenName.toLowerCase().substring(1);
                        signUpNewUser(givenEmail, givenPassword);
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 400),
                            child: DashboardPage(userName: name),
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.blue.shade800,
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Already have an account?",
                        textColor: Colors.black,
                        textSize: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(milliseconds: 400),
                              child: HomePage(),
                            ),
                          );
                        },
                        child: CustomText(
                          textColor: Colors.blue,
                          text: "Log In",
                          textSize: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
