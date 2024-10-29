import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageSender {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      return File(image.path);
    }
    return null;
  }

  Future<File?> captureImageWithCamera() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if(image != null) {
      return File(image.path);
    }
    return null;
  }
}