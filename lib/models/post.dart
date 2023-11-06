// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String recipe;
  final String description;
  final String steps;
  final String uid;
  final String username;
  final String postId;
  final datePublished;
  final List<String> postUrl;

  final int likes;

  const Post({
    required this.recipe,
    required this.description,
    required this.steps,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.likes,
  });

  Map<String, dynamic> tojson() => {
        "recipe": recipe,
        "description": description,
        "steps": steps,
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
        recipe: snapshot["recipe"],
        description: snapshot["description"],
        steps: snapshot["steps"],
        uid: snapshot["uid"],
        username: snapshot["username"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        postUrl: snapshot["postUrl"],
        likes: snapshot["likes"]);
  }
}
