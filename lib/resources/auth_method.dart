import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authmethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up method
  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String cnfpassword,
  }) async {
    String res = "Some error occurred";
    try {
      if (username.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          cnfpassword.isNotEmpty && (password == cnfpassword)) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // add user to firestore
        await _firestore.collection("users").doc(cred.user!.uid).set({
          'username': username,
          'email': email,
          'uid': cred.user!.uid,
        });
        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}