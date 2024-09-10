import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/model/user_model.dart';
import 'package:yojo_chats/provider/auth_provider.dart';
import 'package:yojo_chats/utils/utils.dart';
import 'package:yojo_chats/widgets/buttons/custom_button.dart';

import '../services/store_data.dart';
import '../components/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final bioController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = await ap.getDataFromFireStore(); // Fetch user data

    setState(() {
      fNameController.text = userModel.fName.isNotEmpty ? userModel.fName : '';
      lNameController.text = userModel.lName.isNotEmpty ? userModel.lName : '';
      bioController.text = userModel.bio.isNotEmpty ? userModel.bio : '';
      phoneController.text = userModel.phoneNumber.isNotEmpty ? userModel.phoneNumber : '';
      image = userModel.profilePic.isNotEmpty ? File(userModel.profilePic) : null;
    });
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  void handleSave() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final UserModel currentUser = ap.userModel!;

    final String updateFName = fNameController.text.isNotEmpty ? fNameController.text : currentUser.fName;
    final String updateLName = lNameController.text.isNotEmpty ? lNameController.text : currentUser.lName;
    final String updateBio = bioController.text.isNotEmpty ? bioController.text : currentUser.bio;

    StoreData(
      context: context,
      fNameController: TextEditingController(text: updateFName),
      lNameController: TextEditingController(text: updateLName),
      bioController: TextEditingController(text: updateBio),
      phoneController: phoneController,
      image: image,
    ).storeData();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => selectImage(),
                        child: image == null
                            ? const CircleAvatar(
                                backgroundColor: Colors.cyan,
                                radius: 80,
                                child: Icon(
                                  Iconsax.user,
                                  size: 80,
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
                            CTextField(
                              hintText: "BIO",
                              icon: Iconsax.user,
                              inputType: TextInputType.name,
                              maxLines: 2,
                              controller: bioController,
                            ),
                            CTextField(
                              hintText: "First Name",
                              icon: Iconsax.user,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: fNameController,
                            ),
                            CTextField(
                              hintText: "Last Name",
                              icon: Iconsax.user,
                              inputType: TextInputType.name,
                              maxLines: 1,
                              controller: lNameController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: CustomButton(
                          text: "Save",
                          onPressed: () => handleSave(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
