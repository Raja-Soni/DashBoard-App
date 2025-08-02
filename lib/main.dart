import 'package:dashboard_app/custom_widgets/custom_button.dart';
import 'package:dashboard_app/custom_widgets/custom_text.dart';
import 'package:dashboard_app/pages/dashboard_page.dart';
import 'package:dashboard_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'custom_widgets/custom_input_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fundraiser Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String givenEmail = "";
  String? givenPassword;
  final formKey = GlobalKey<FormState>();

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
                  text: "Login",
                  textBoldness: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 100.0),
                    child: CustomText(
                      text: "Welcome!",
                      textBoldness: FontWeight.bold,
                      textColor: Colors.black,
                      textSize: 45,
                    ),
                  ),
                  CustomFormTextField(
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                    icon: Icon(Icons.email_outlined),
                    validate: (String? value) {
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
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
                    buttonText: "LOG IN",
                    callback: () {
                      bool isValidate = formKey.currentState!.validate();
                      if (isValidate) {
                        formKey.currentState!.save();
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 400),
                            child: DashboardPage(userName: getName(givenEmail)),
                          ),
                        );
                      }
                    },
                    backgroundColor: Colors.blue.shade800,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Don't have an account?",
                        textColor: Colors.black,
                        textSize: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(milliseconds: 400),
                              child: SignupPage(),
                            ),
                          );
                        },
                        child: CustomText(
                          textColor: Colors.blue,
                          text: "Sign Up",
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
