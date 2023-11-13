import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/user.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/resources/firestore_method.dart';
import 'package:food_app/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class Commnets extends StatefulWidget {
  final snap;
  const Commnets({Key? key, required this.snap}) : super(key: key);

  @override
  State<Commnets> createState() => _CommnetsState();
}

class _CommnetsState extends State<Commnets> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Posts')
              .doc(widget.snap['postId'])
              .collection('comments')
              .orderBy('datePublished', descending: true)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => CommentCard(
                      snap: snapshot.data!.docs[index].data(),
                    ));
          }),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/media/FxCevcIakAAW8Vt.jpg:large'),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8),
                  child: TextField(
                    controller: _commentController,
                    decoration: const InputDecoration(
                        hintText: 'Comment as Username',
                        border: InputBorder.none),
                    maxLines: null,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await FirestoreMethod().comment(widget.snap['postId'],
                      user.uid, user.username, _commentController.text);
                  setState(() {
                    _commentController.text = "";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
