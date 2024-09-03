import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future<File?> pickImage(BuildContext context) async {
  File? image;
  PermissionStatus status;

  if (Platform.isAndroid && await DeviceInfoPlugin().androidInfo.then((info) => info.version.sdkInt >= 33)) {
    status = await Permission.photos.request();
  } else {
    status = await Permission.storage.request();
  }

  if (status.isGranted) {
    try {
      final pickImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
      );
      if (pickImage != null) {
        image = File(pickImage.path);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  } else if (status.isDenied) {
    showSnackBar(context, 'Permission to access photos was denied.');
  } else if (status.isPermanentlyDenied) {
    showSnackBar(context,
        'Permission to access photos permanently denied. Please enable it in the app settings.');
    await openAppSettings();
  }
  return image;
}
