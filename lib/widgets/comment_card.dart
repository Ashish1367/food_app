import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage:
                NetworkImage('https://i.postimg.cc/sfZnbTgN/v1a9mi7r92ib1.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                    text: 'Username :- ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                      text: " Yo Mara Comment Hai",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black)),
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
