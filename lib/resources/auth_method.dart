import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/models/user.dart' as model;

class Authmethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserdetails() async {
    User currentuser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection("users").doc(currentuser.uid).get();
    return model.User.fromsnap(snap);
  }

  //sign up method
  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required String cnfpassword,
  }) async {
    String res = "Some error occurred";
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          cnfpassword.isNotEmpty &&
          (password == cnfpassword)) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        model.User user = model.User(
          username: username,
          email: email,
          uid: cred.user!.uid,
        );

        // adding user to firestore
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.tojson());

        res = "success";
      } else {
        res = "Please all the details";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //sign in method
  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";
    try {
      //login User
      if (password.isNotEmpty && email.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please fill all the fields";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
