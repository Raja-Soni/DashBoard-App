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
    '₹72500',
    '₹45000',
    '₹91200',
    '₹18750',
    '₹66300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 25),
        ),
        title: CustomText(text: "Top LeaderBoard", textSize: 30),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: topDonatorNames.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            leading: CustomText(
              text: "${index + 1}",
              textColor: Colors.black,
              textSize: 22,
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.blue.shade100,
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
    );
  }
}
