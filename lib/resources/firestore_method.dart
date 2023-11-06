// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/post.dart';
import 'package:food_app/resources/storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String steps, String recipe, String description,
      List<Uint8List> files, String uid, String username) async {
    String res = "Some error occured";
    try {
      List<String> photoUrls = [];
      for (Uint8List file in files) {
        String photoUrl =
            await StorageMethod().uploadImageToStorage('posts', file, true);
        photoUrls.add(photoUrl);
      }

      String postId = Uuid().v1();
      Post post = Post(
          recipe: recipe,
          description: description,
          steps: steps,
          uid: uid,
          username: username,
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: photoUrls,
          likes: 0);
      _firestore.collection("Posts").doc(postId).set(post.tojson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> like(String postId, int likes, bool plus) async {
    try {
      int incrementValue = plus ? -1 : 1;
      await _firestore
          .collection('Posts')
          .doc(postId)
          .update({'likes': FieldValue.increment(incrementValue)});
    } catch (e) {
      e.toString();
    }
  }

  Future<void> disLike(String postId, int likes, bool minus) async {
    try {
      int incrementValue = minus ? -1 : 1;
      await _firestore
          .collection('Posts')
          .doc(postId)
          .update({'likes': FieldValue.increment(incrementValue)});
    } catch (e) {
      e.toString();
    }
  }
}
