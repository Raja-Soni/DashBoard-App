import 'package:dashboard_app/custom_widgets/custom_container.dart';
import 'package:dashboard_app/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => LeaderboardPageState();
}

class LeaderboardPageState extends State<LeaderboardPage> {
  List<String> topDonatorNames = [
    'Aarav Mehta',
    'Sneha Reddy',
    'Ishaan Verma',
    'Priya Kapoor',
    'Rohit Nair',
  ];
  final List<String> topDonatorScores = [
    '₹72,500',
    '₹45,000',
    '₹91,200',
    '₹18,750',
    '₹66,300',
  ];

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
          title: CustomText(text: "LeaderBoard", textSize: 30),
          backgroundColor: Colors.blue.shade800,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: CustomContainer(
                width: double.infinity,
                borderRadius: 10,
                backgroundColor: Colors.green.shade100,
                child: Center(
                  child: CustomText(
                    text: "Top Donators",
                    textColor: Colors.black,
                    textSize: 30,
                    textBoldness: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainer(
                  borderRadius: 10.0,
                  backgroundColor: Colors.blue.shade100,
                  child: ListView.builder(
                    itemCount: topDonatorNames.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: Card(
                        color: Colors.grey.shade100,
                        child: ListTile(
                          leading: CustomText(
                            text: "${index + 1}",
                            textColor: Colors.black,
                            textSize: 22,
                          ),
                          title: Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey.shade400,
                                child: Icon(Icons.person_2_outlined),
                              ),
                              SizedBox(width: 8),
                              CustomText(
                                text: topDonatorNames[index],
                                textColor: Colors.black,
                                textSize: 23,
                              ),
                            ],
                          ),
                          trailing: CustomText(
                            text: topDonatorScores[index],
                            textColor: Colors.black,
                            textSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
