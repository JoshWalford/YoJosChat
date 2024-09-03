import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_model.dart';
import '../provider/auth_provider.dart';
import '../screens/contacts_screen.dart';
import '../utils/utils.dart';

class StoreData {
  final BuildContext context;
  final TextEditingController fNameController;
  final TextEditingController lNameController;
  final TextEditingController bioController;
  final TextEditingController phoneController;
  final File? image;

  StoreData({
    required this.context,
    required this.fNameController,
    required this.lNameController,
    required this.image,
    required this.bioController,
    required this.phoneController,
  });

  Future<void> storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      fName: fNameController.text.trim(),
      lName: lNameController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createAt: "",
      phoneNumber: "",
      uid: "",
    );

    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.savedUserDataToSp().then(
                (value) => ap.setSignIn().then(
                  (value) => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactsScreen(),
                ),
                    (route) => false,
              ),
            ),
          );
        },
      );
    } else {
      showSnackBar(context, "Please upload a profile picture");
    }
  }
}
