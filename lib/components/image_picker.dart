// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<List<Uint8List>?> pickImages(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  List<XFile>? files = await _imagePicker.pickMultiImage();

  if (files.isEmpty) {
    List<Uint8List> imagesBytes =
        await Future.wait(files.map((file) async => await file.readAsBytes()));
    return imagesBytes;
  }
  return null;
}
