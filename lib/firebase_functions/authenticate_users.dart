import 'package:firebase_auth/firebase_auth.dart';

signUpNewUser(String uEmail, uPassword) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: uEmail, password: uPassword);
    print("///////////////  User Added ////////////////");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print("?????????????? $e ???????????????????");
  }
}

Future<Map<String, dynamic>> signInUser(String uEmail, uPassword) async {
  Map<String, dynamic> result = {'success': false, 'str': ''};

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: uEmail,
      password: uPassword,
    );
    result['success'] = true;
    print("///////////////  Logged In ////////////////");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      result['success'] = false;
      result['str'] = 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      result['success'] = false;
      result['str'] = 'Wrong password provided for that user.';
    } else if (e.code == 'invalid-credential') {
      result['success'] = false;
      result['str'] = 'Invalid email or password.';
    } else {
      result['success'] = false;
      result['str'] = 'Unhandled FirebaseAuth error: ${e.message}';
    }
  }
  return result;
}
