// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:yojo_chats/screens/otp_screen.dart';
// import 'package:yojo_chats/screens/contacts_screen.dart';
// import 'package:yojo_chats/screens/login_screen.dart';
//
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//   var verificationId = ''.obs;
//
//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }
//
//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => const LoginScreen())
//         : Get.offAll(() => const ContactsScreen());
//   }
//
//   /// Function
//   Future<void> phoneAuthentication(String phoneNo) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNo,
//       verificationCompleted: (credential) async {
//         await _auth.signInWithCredential(credential);
//       },
//       codeSent: (verificationId, resendToken) {
//         this.verificationId.value = verificationId;
//         Get.to(() => const OTPScreen());
//       },
//       codeAutoRetrievalTimeout: (verificationId) {
//         this.verificationId.value = verificationId;
//       },
//       verificationFailed: (e) {
//         if (e.code == 'invalid-phone-number') {
//           Get.snackbar('Error', 'The provided phone is not valid.');
//         } else {
//           Get.snackbar('Error', 'Something went wrong try again.');
//         }
//       },
//     );
//   }
//
//   Future<bool> verifyOTP(String otp) async {
//     var credentials = await _auth.signInWithCredential(
//         PhoneAuthProvider.credential(
//             verificationId: verificationId.value, smsCode: otp));
//     return credentials.user != null ? true : false;
//   }
// }
