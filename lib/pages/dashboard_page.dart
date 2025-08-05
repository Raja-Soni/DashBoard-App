import 'package:dashboard_app/custom_widgets/custom_button.dart';
import 'package:dashboard_app/custom_widgets/custom_input_text_field.dart';
import 'package:dashboard_app/custom_widgets/custom_listtile.dart';
import 'package:dashboard_app/custom_widgets/custom_text.dart';
import 'package:dashboard_app/pages/announcement_page.dart';
import 'package:dashboard_app/pages/leaderboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';

class DashboardPage extends StatefulWidget {
  final String userName;
  const DashboardPage({super.key, required this.userName});

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  int donation = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Icon(Icons.dashboard, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Expanded(child: CustomText(text: "DashBoard", textSize: 30)),
            PopupMenuButton(
              iconColor: Colors.white,
              color: Colors.white,
              onSelected: (value) async {
                if (value == "Announcements") {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 400),
                      child: AnnouncementPage(),
                    ),
                  );
                } else if (value == "Leader Board") {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 400),
                      child: LeaderboardPage(),
                    ),
                  );
                } else if (value == "Logout") {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 400),
                      child: HomePage(),
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: "Leader Board",
                  child: CustomText(
                    text: "Leader Board",
                    textColor: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  value: "Announcements",
                  child: CustomText(
                    text: "Announcements",
                    textColor: Colors.black,
                  ),
                ),
                PopupMenuItem(
                  value: "Logout",
                  child: CustomText(text: "Logout", textColor: Colors.black),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text:
                  widget.userName[0].toUpperCase() +
                  widget.userName.toLowerCase().substring(1),
              textSize: 40,
              textBoldness: FontWeight.bold,
              textColor: Colors.black,
            ),
            CustomText(
              text: '${widget.userName}12345',
              textSize: 20,
              textColor: Colors.grey.shade700,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomText(
              text: 'Total Donation Raised',
              textSize: 30,
              textColor: Colors.black,
              textBoldness: FontWeight.bold,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: '₹$donation',
                  textSize: 25,
                  textColor: Colors.black,
                  textBoldness: FontWeight.bold,
                ),
                CustomButton(
                  buttonText: "Donate",
                  backgroundColor: Colors.blue.shade700,
                  callback: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BottomSheet(
                          onClosing: () {},
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Enter Donation Amount",
                                    textSize: 30,
                                    textColor: Colors.black,
                                    textBoldness: FontWeight.bold,
                                  ),
                                  SizedBox(height: 20),
                                  Form(
                                    key: formKey,
                                    child: CustomFormTextField(
                                      cursorColor: Colors.black,
                                      inputType: TextInputType.number,
                                      hintText: 'Enter amount here',
                                      icon: Icon(Icons.currency_rupee_rounded),
                                      validate: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter a donation amount";
                                        }

                                        if (!RegExp(r'^\d+$').hasMatch(value)) {
                                          return "Please enter numbers only";
                                        }
                                        return null;
                                      },
                                      savedValue: (String? value) {
                                        donation += int.parse(value!);
                                        setState(() {});
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  CustomButton(
                                    backgroundColor: Colors.green,
                                    buttonText: "Donate",
                                    callback: () {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        Navigator.pop(context);
                                      }
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  CustomButton(
                                    backgroundColor: Colors.red,
                                    buttonText: "Cancel",
                                    callback: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomText(
              text: 'Rewards/Unlockables',
              textSize: 30,
              textColor: Colors.black,
              textBoldness: FontWeight.bold,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  CustomListTile(
                    iconBgColor: Colors.pink.shade100,
                    titleName: "Kindness Starter",
                    subTitleName: "Donate ₹10,000 to unlock this reward",
                    rewardIcon: Icon(
                      Icons.volunteer_activism,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  CustomListTile(
                    iconBgColor: Colors.orange.shade200,
                    titleName: "Generous Giver",
                    subTitleName: "Donate ₹20,000 to unlock this reward",
                    rewardIcon: Icon(
                      Icons.star_rounded,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  CustomListTile(
                    iconBgColor: Colors.purple.shade100,
                    titleName: "Hope Spreader",
                    subTitleName: "Donate ₹30,000 to unlock this reward",
                    rewardIcon: Icon(
                      Icons.favorite,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  CustomListTile(
                    iconBgColor: Colors.blue.shade100,
                    titleName: "Visionary Donor",
                    subTitleName: "Donate ₹40,000 to unlock this reward",
                    rewardIcon: Icon(
                      Icons.diamond_outlined,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  CustomListTile(
                    iconBgColor: Colors.green.shade100,
                    titleName: "Major Impact Maker",
                    subTitleName: "Donate ₹80,000 to unlock this reward",
                    rewardIcon: Icon(
                      Icons.public,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  CustomListTile(
                    iconBgColor: Colors.cyan.shade100,
                    titleName: "Major Supporter",
                    subTitleName: "Donate ₹100,000 to unlock this reward",
                    rewardIcon: Icon(
                      Icons.military_tech,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
