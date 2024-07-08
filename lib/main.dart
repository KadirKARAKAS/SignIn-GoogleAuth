import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:signin_google_auth/firebase_options.dart';
import 'package:signin_google_auth/homePage.dart';
import 'package:signin_google_auth/test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (FirebaseAuth.instance.currentUser != null) {
    print("User ID => ${FirebaseAuth.instance.currentUser?.uid}");
    runApp(const MaterialApp(
      home: TestPage(),
    ));
  } else {
    print("User's not sign-in");
    runApp(const MaterialApp(
      home: Homepage(),
    ));
  }
}
