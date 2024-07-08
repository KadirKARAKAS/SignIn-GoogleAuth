import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_google_auth/constant.dart';
import 'package:signin_google_auth/controllers/user_controller.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String? profilePhotoURL;
  bool isLoading = false;
  List<Map<String, dynamic>> userList = [];

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  void _checkUser() {
    setState(() {
      isLoading = true;
    });
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          profilePhotoURL = user.photoURL;
          isLoading = false;
        });
        print("User ID: ${user.uid}");
        print("Profile Photo URL: $profilePhotoURL");
      } else {
        setState(() {
          profilePhotoURL = null;
          isLoading = false;
        });
        print("No user is signed in");
      }
    });
  }

  Future<void> _getUserList() async {
    final users = await UserController.getUserList();
    setState(() {
      userList = users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: const Text(
            "Home Page",
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                if (isLoading)
                  const CircularProgressIndicator()
                else if (profilePhotoURL != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(999)),
                      ),
                      child: Image.network(profilePhotoURL!),
                    ),
                  )
                else
                  const Text("Profil fotoğrafı yok"),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      userMail,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getUserList,
              child: const Text("Kullanıcı Listesini Getir"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return ListTile(
                    leading: user['photoURL'] != null
                        ? Image.network(user['photoURL'])
                        : const Icon(Icons.account_circle),
                    title: Text(user['displayName'] ?? 'No Name'),
                    subtitle: Text(user['email'] ?? 'No Email'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
