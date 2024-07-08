import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_google_auth/constant.dart';
import 'package:signin_google_auth/controllers/user_controller.dart';

import 'test_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "Login App",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 400),
          InkWell(
            onTap: () async {
              try {
                final user = await UserController.loginWithGoogle();
                userID = user.toString();
                if (user != null && mounted) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => TestPage(),
                  ));
                }
              } on FirebaseAuthException catch (error) {
                print(error.message);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error.message ?? "Hata, tekrar deneyiniz!")));
              }
            },
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Sign-in Google",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TestPage(),
                        ));
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Navigate Test Page",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
