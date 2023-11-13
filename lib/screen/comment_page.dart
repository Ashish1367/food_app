import 'package:flutter/material.dart';
import 'package:food_app/widgets/comment_card.dart';

class Commnets extends StatelessWidget {
  const Commnets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: const CommentCard(),
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
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 8),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Comment as Username',
                        border: InputBorder.none),
                    maxLines: null,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
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
