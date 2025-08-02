import 'package:dashboard_app/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_container.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => AnnouncementPageState();
}

class AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 25),
          ),
          title: CustomText(text: "Announcements", textSize: 30),
          backgroundColor: Colors.blue.shade800,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  backgroundColor: Colors.blue.shade100,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                      text:
                          "🙏 A Heartfelt Thank You! \nWe deeply appreciate your generosity and support. Every rupee donated is a step closer to making a real difference. Whether you’ve donated ₹10 or ₹1,00,000 — you're a valuable part of this journey. Thank you for believing in the cause! ❤️",
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),

              Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  backgroundColor: Colors.blue,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 10.0,
                    ),
                    child: CustomText(
                      text: "New Announcements!!!",
                      textColor: Colors.white,
                      textSize: 25,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  backgroundColor: Colors.blue.shade100,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                      text:
                          "🎉 Milestone Achieved!!! \nWe've officially crossed ₹1,00,000 in total donations! This wouldn't have been possible without your continued effort and referrals.",
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  backgroundColor: Colors.blue.shade100,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                      text:
                          "💖 You're Making a Real Impact!!! \nThanks to your support, we’ve funded clean drinking water for over 200 families. Every donation counts — and yours truly made a difference!",
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  backgroundColor: Colors.blue.shade100,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                      text:
                          "🧩 Your Referral Made a Difference \nOne of your referrals just donated! You’ve helped bring more hands into the mission — and your impact is multiplying.",
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  backgroundColor: Colors.blue.shade100,
                  borderRadius: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomText(
                      text:
                          "📣 Community Goal Just Unlocked!!! \nWe've collectively reached ₹2,00,000! Thanks to donors like you, a new education kit will be delivered to underprivileged schools.",
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
