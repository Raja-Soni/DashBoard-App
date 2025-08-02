import 'package:dashboard_app/custom_widgets/custom_listtile.dart';
import 'package:dashboard_app/custom_widgets/custom_text.dart';
import 'package:dashboard_app/pages/announcement_page.dart';
import 'package:dashboard_app/pages/leaderboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class DashboardPage extends StatefulWidget {
  final String userName;
  const DashboardPage({super.key, required this.userName});

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.dashboard, color: Colors.white, size: 30),
            SizedBox(width: 10),
            Expanded(child: CustomText(text: "DashBoard", textSize: 30)),
            PopupMenuButton(
              iconColor: Colors.white,
              color: Colors.white,
              onSelected: (value) {
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
                } else if (value == "Exit") {
                  SystemNavigator.pop();
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
                  value: "Exit",
                  child: CustomText(text: "Exit", textColor: Colors.black),
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
            CustomText(
              text: '₹5,000',
              textSize: 25,
              textColor: Colors.black,
              textBoldness: FontWeight.bold,
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
