// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:food_app/components/image_picker.dart';
import 'package:food_app/components/snack_bar.dart';
import 'package:food_app/models/user.dart';
import 'package:food_app/provider/user_provider.dart';
import 'package:food_app/resources/firestore_method.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  Uint8List? _file;
  final TextEditingController _discriptionController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  bool _isloading = false;

  void postImage(String uid, String username) async {
    try {
      setState(() {
        _isloading = true;
      });
      String res = await FirestoreMethod()
          .uploadPost(_discriptionController.text, _file!, uid, username);
      if (res == "success") {
        setState(() {
          _isloading = false;
        });
        showSnackBar("Posted !", context);
        clearimage();
      } else {
        setState(() {
          _isloading = false;
        });
        showSnackBar(res, context);
      }
    } catch (e) {
      setState(() {
        _isloading = false;
      });
      showSnackBar(e.toString(), context);
    }
  }

  _selectimage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a Photo'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void clearimage() {
    _file = null;
  }

  @override
  void dispose() {
    super.dispose();
    _discriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () => _selectimage(context),
                icon: const Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              title: const Text('Post Page'),
              centerTitle: false,
              actions: [
                TextButton(
                    onPressed: () => postImage(user.uid, user.username),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _isloading
                      ? const LinearProgressIndicator()
                      : const Padding(padding: EdgeInsets.only(top: 0)),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://media-del1-1.cdn.whatsapp.net/v/t61.24694-24/379696380_1040290580489912_5158158593023893496_n.jpg?ccb=11-4&oh=01_AdQhc5mctGTdyOhlsahDFwnFQOn8Fk8wBaoICujo7MQH1w&oe=65489E74&_nc_sid=000000&_nc_cat=108'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextField(
                          controller: _discriptionController,
                          decoration: const InputDecoration(
                            hintText: 'Recipe Name',
                            border: InputBorder.none,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _recipeController,
                          decoration: const InputDecoration(
                              hintText: "Write Steps",
                              border: InputBorder.none),
                          maxLines: null,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
