import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  // Google ile giriş yapma ve kullanıcıyı Firestore'a kaydetme metodu
  static Future<User?> loginWithGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();
    final googleAuth = await googleAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    final user = userCredential.user;
    if (user != null) {
      await saveUserToFirestore(user); // Kullanıcıyı Firestore'a kaydet
    }

    return user;
  }

  // Kullanıcıyı Firestore'a kaydetme metodu
  static Future<void> saveUserToFirestore(User user) async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final userDoc = usersCollection.doc(user.uid);
    await userDoc.set({
      'uid': user.uid,
      'displayName': user.displayName,
      'email': user.email,
      'photoURL': user.photoURL,
    });
  }

  // Firestore'dan kullanıcı listesini getirme metodu
  static Future<List<Map<String, dynamic>>> getUserList() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final querySnapshot = await usersCollection.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
