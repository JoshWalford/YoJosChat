import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/provider/auth_provider.dart';
import 'package:yojo_chats/utils/utils.dart';
import 'package:yojo_chats/widgets/buttons/custom_button.dart';
import 'package:yojo_chats/services/store_data.dart';

import '../components/text_field.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  File? image;
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final bioController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    fNameController.dispose();
    lNameController.dispose();
    bioController.dispose();
    phoneController.dispose();
  }

  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  void handleContinue() {
    StoreData(
      context: context,
      fNameController: fNameController,
      lNameController: lNameController,
      bioController: bioController,
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
                            CTextField(
                                hintText: "Enter your First Name",
                                icon: Iconsax.user,
                                inputType: TextInputType.name,
                                maxLines: 1,
                                controller: fNameController),
                            CTextField(
                                hintText: "Enter your last Name",
                                icon: Iconsax.user,
                                inputType: TextInputType.name,
                                maxLines: 1,
                                controller: lNameController),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.90,
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () => handleContinue(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
