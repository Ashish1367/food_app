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
  List<Uint8List> _file = [];
  final TextEditingController _discriptionController = TextEditingController();
  final TextEditingController _recipeController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();
  bool _isloading = false;

  void postImage(String uid, String username) async {
    try {
      setState(() {
        _isloading = true;
      });
      String res = await FirestoreMethod().uploadPost(
          _stepsController.text,
          _recipeController.text,
          _discriptionController.text,
          _file,
          uid,
          username);
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
                  Uint8List file = await pickImages(ImageSource.camera);
                  setState(() {
                    _file.add(file);
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImages(ImageSource.gallery);
                  setState(() {
                    _file.add(file);
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
    _file = [];
  }

  @override
  void dispose() {
    super.dispose();
    _recipeController.dispose();
    _discriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return _file.isEmpty
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
                          controller: _recipeController,
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
                        child: PageView.builder(
                          itemCount: _file.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: MemoryImage(_file[index]),
                                      fit: BoxFit.fill,
                                      alignment: FractionalOffset.topCenter)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () => _selectimage(context),
                      child: const Text('Add Images')),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _discriptionController,
                          decoration: const InputDecoration(
                            hintText: "Add a description",
                            border: InputBorder.none,
                          ),
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: TextField(
                          controller: _stepsController,
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
