// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final String postUrl;

  final likes;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.likes,
  });

  Map<String, dynamic> tojson() => {
        "description": description,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        "postUrl": postUrl,
        "likes": likes
      };
  static Post fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
        description: snapshot["description"],
        uid: snapshot["uid"],
        username: snapshot["username"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        postUrl: snapshot["postUrl"],
        likes: snapshot["likes"]);
  }
}
