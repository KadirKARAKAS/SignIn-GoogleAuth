import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:signin_google_auth/constant.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TEST PAGE")),
        body: Column(
          children: [
            const SizedBox(height: 200),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // FirebaseAuth.instance.authStateChanges().listen((User? user) {
                  //   if (user != null) {
                  //     print(user.uid);
                  //   }
                  // });

                  if (FirebaseAuth.instance.currentUser != null) {
                    print(FirebaseAuth.instance.currentUser?.uid);
                  } else {
                    print("kullanıcı giriş yapmadı");
                  }
                },
                child: Text("Kullanıcı girişi sorgulama"),
              ),
            )
          ],
        ));
  }
}
