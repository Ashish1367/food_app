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
          likes: []);
      _firestore.collection("Posts").doc(postId).set(post.tojson());
      res = "success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> like(String postId, String uid, List likes) async {
    try {
      if (likes.contains(uid)) {
        _firestore.collection('Posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        _firestore.collection('Posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> comment(
      String postId, String uid, String username, String text) async {
    try {
      if (text.isNotEmpty) {
        String commentId = Uuid().v1();
        await _firestore
            .collection('Posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'name': username,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now()
        });
      } else {
        print('Text is empty');
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await _firestore.collection('Posts').doc(postId).delete();
    } catch (e) {
      e.toString();
    }
  }
}
