// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_app/models/user.dart';
import 'package:food_app/resources/firestore_method.dart';
import 'package:food_app/widgets/steps.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class PostCard extends StatefulWidget {
  final snap;

  const PostCard({super.key, required this.snap});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Steps(steps: widget.snap['steps'])));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        color: const Color(0xFF1f99fa),
        child: Column(
          children: [
            //HEADER SECTION
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4)
                  .copyWith(right: 0),
              child: Row(children: [
                //PROFILE PIC
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      'https://media-del1-1.cdn.whatsapp.net/v/t61.24694-24/379696380_1040290580489912_5158158593023893496_n.jpg?ccb=11-4&oh=01_AdSKtAcBA392qJccHmycIIS2qzwNVMwt-IzpnYjSWxt1pA&oe=654C92F4&_nc_sid=000000&_nc_cat=108'),
                ),

                //USERNAME
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.snap["recipe"],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                //DELETE OPTION
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: ['delete']
                                        .map((e) => InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                            ))
                                        .toList()),
                              ));
                    },
                    icon: const Icon(Icons.more_vert))
              ]),
            ),

            //IMAGE SECTION
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              width: double.infinity,
              child: PageView.builder(
                itemCount: widget.snap["postUrl"].length,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.snap["postUrl"][index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            //BOTTOM SECTION(ICONS)
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    FirestoreMethod().like(
                      widget.snap['postId'],
                      user.uid,
                      widget.snap['likes'],
                    );
                  },
                  icon: const Icon(Icons.favorite),
                  color: Colors.red,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.bookmark)),
                )),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.snap['likes'].length} likes',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  //DISCRIPTION
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 8),
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 63, 63, 63)),
                          children: [
                            TextSpan(
                              text:
                                  'description :-  ${widget.snap['description']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ]),
                    ),
                  ),

                  //COMMENT
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text(
                        "View all comments",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  //DATE
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMd()
                          .format(widget.snap['datePublished'].toDate()),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
