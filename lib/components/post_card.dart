import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      color: Colors.white,
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
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
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
            child: Image.network(
              'https://i.postimg.cc/rynsjjFp/Whats-App-Image-2023-10-17-at-10-32-49-AM.jpg',
              fit: BoxFit.cover,
            ),
          ),

          //BOTTOM SECTION
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(MdiIcons.arrowUpBoldOutline),
                color: Colors.red,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(MdiIcons.arrowDownBoldOutline),
                color: Colors.purpleAccent,
              ),
              IconButton(
                  onPressed: () {}, icon: Icon(MdiIcons.commentTextOutline)),
              IconButton(onPressed: () {}, icon: Icon(MdiIcons.share)),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {}, icon: Icon(MdiIcons.bookmarkPlusOutline)),
              )),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '69 Likes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                //DISCRIPTION
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        style:
                            TextStyle(color: Color.fromARGB(255, 63, 63, 63)),
                        children: [
                          TextSpan(
                            text: 'Username:- ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          TextSpan(text: 'HUMAR CAT <3'),
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
                  child: const Text(
                    "10/31/2023",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
