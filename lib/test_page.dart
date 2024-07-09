import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  String? userID2;

  @override
  void initState() {
    super.initState();
    _checkUser();
    _getUserList();
  }

  void _checkUser() {
    setState(() {
      isLoading = true;
    });
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          userID2 = user.uid;
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

  Map<String, dynamic>? _getUserByID(String? userID) {
    if (userID == null) return null;
    for (var user in userList) {
      if (user['uid'] == userID) {
        return user;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _getUserByID(userID2);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
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
                if (currentUser != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentUser["displayName"] ?? "No Display Name",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500)),
                      Text(currentUser["email"] ?? "No Email",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300)),
                    ],
                  )
                else
                  const Text("Kullanıcı bilgileri yok"),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Üyeler",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];
                  return listTitle(user, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell listTitle(Map<String, dynamic> user, int index) {
    return InkWell(
      onTap: () {
        print(index);
      },
      child: Stack(
        children: [
          Container(),
          ListTile(
            leading: user['photoURL'] != null
                ? Image.network(user['photoURL'])
                : const Icon(Icons.account_circle),
            title: Text(user['displayName'] ?? 'No Name'),
            subtitle: Text(user['email'] ?? 'No Email'),
          ),
        ],
      ),
    );
  }
}
