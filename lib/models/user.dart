import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String email;
  final String uid;

  const User({
    required this.username,
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> tojson() => {
        "username": username,
        "email": email,
        "uid": uid,
      };
  static User fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        username: snapshot["username"],
        email: snapshot["email"],
        uid: snapshot["uid"]);
  }
}
