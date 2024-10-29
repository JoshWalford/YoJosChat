import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerHelper {
  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }

  Future<File?> pickSpecificFileType() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );

    if (result != null) {
      return File(result.files.single.path!);
    }
    return null;
  }
}