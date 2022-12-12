// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    return user;
  }

  Future<User?> signInWithEmailPw(String email, String password) async {
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    return user;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  User? currentUser() {
    final user = auth.currentUser;
    return user;
  }
}
//ebookuser3@gmail.com