import 'package:cloud_firestore/cloud_firestore.dart';

create(String name, int donation, String email) async {
  await FirebaseFirestore.instance.collection("Donators").doc(email).set({
    'name': name,
    'donation': donation,
  });
}
