import 'package:cloud_firestore/cloud_firestore.dart';

create(String name, int donation, String email) async {
  final check = await FirebaseFirestore.instance
      .collection("Donators")
      .doc(email)
      .get();
  if (check.exists) {
    final oldTotalDonation = check['donation'];
    final newTotalDonation = oldTotalDonation + donation;
    await FirebaseFirestore.instance.collection("Donators").doc(email).update({
      'name': name,
      'donation': newTotalDonation,
    });
  } else {
    await FirebaseFirestore.instance.collection("Donators").doc(email).set({
      'name': name,
      'donation': donation,
      'email': email,
    });
  }
}
