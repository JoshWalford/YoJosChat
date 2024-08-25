import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/model/user_model.dart';
import 'package:yojo_chats/provider/auth_provider.dart';
import 'package:yojo_chats/screens/chat_screen.dart';
import 'package:yojo_chats/screens/contacts_screen.dart';
import 'package:yojo_chats/utils/utils.dart';
import 'package:yojo_chats/widgets/buttons/custom_button.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? image;
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fnameController.dispose();
    lnameController.dispose();
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
                child: Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => selectImage(),
                        child: image == null
                            ? const CircleAvatar(
                                backgroundColor: Colors.cyan,
                                radius: 50,
                                child: Icon(
                                  Iconsax.user,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: 50,
                              ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            textField(
                              hintText: "Enter your First Name",
                              icon: Iconsax.user,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: fnameController,
                            ),
                            textField(
                              hintText: "Enter your last Name",
                              icon: Iconsax.user,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: lnameController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () => storeData(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget textField({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.cyan,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.cyan,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.bold),
          alignLabelWithHint: true,
          border: InputBorder.none,
        ),
      ),
    );
  }

  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      fName: fnameController.text.trim(),
      lName: fnameController.text.trim(),
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
                            (route) => false),
                      ),
                );
          });
    } else {
      showSnackBar(context, "Please upload a profile picture");
    }
  }
}
