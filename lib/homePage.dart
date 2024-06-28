import 'package:flutter/material.dart';

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
          SizedBox(height: 30),
          Center(
            child: Text(
              "Login App",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 700),
          InkWell(
            onTap: () {},
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Sign-in Google",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
