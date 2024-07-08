import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_google_auth/constant.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String? profilePhotoURL;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Uygulama yüklendiğinde kullanıcı durumunu kontrol et
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

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      userName = user!.displayName.toString();
      userMail = user!.email.toString();
    });

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
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }

// Future<void> addToDatabase(int index) async {
//     String productName = productNameTextField.text;
//     String productInfo = productInfoTextField.text;
//     String productPrice = productPriceTextField.text;

//     final product = {
//       "productName": productName,
//       "productInfo": productInfo,
//       "productPrice": productPrice,
//       "ProductPhotoURL": _imageFileList![index].path,
//       'createdTime': DateTime.now()
//     };

//     // Yeni bir belge oluşturmak için `add()` yöntemini kullanın.
//     final docRef = await FirebaseFirestore.instance
//         .collection('Users')
//         .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
//         .collection("Products")
//         .add(product);

//     // Oluşturulan belgeye docID ekleyin.
//     await docRef.update({'docId': docRef.id});

//     productNameTextField.clear();
//     productInfoTextField.clear();
//     productPriceTextField.clear();
//     selectedImagePath = "";

//     final userRef = FirebaseFirestore.instance
//         .collection("Users")
//         .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
//         .collection("Products")
//         .orderBy('createdTime', descending: true);

//     final querySnapshot = await userRef.get();
//     getdataList.clear();
//     querySnapshot.docs.forEach((doc) async {
//       await FirebaseFirestore.instance
//           .collection('Users')
//           .doc("IQX8DBt1HaXXg6qdBIfMS0OLsEe2")
//           .collection("Products")
//           .doc(doc.id)
//           .update({'docId': doc.id});
//       getdataList.add(doc.data());
//     });
//   }
}
