// import 'package:get/get.dart';
// import 'package:yojo_chats/repository/authentication_repository.dart';
// import 'package:yojo_chats/screens/contacts_screen.dart';
//
// class OTPController extends GetxController{
//   static OTPController get instance => Get.find();
//
//   void verifyOTP(String otp) async {
//     var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
//     isVerified ? Get.offAll(const ContactsScreen()) : Get.back();
//   }
// }