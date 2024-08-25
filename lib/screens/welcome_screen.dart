import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yojo_chats/screens/login_screen.dart';
import 'package:yojo_chats/widgets/buttons/custom_button.dart';

import '../provider/auth_provider.dart';
import 'contacts_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/undraw_Mobile_messages.png",
                height: 300,
              ),
              const SizedBox(height: 20),
              Text(
                'Let\'s get started',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Time to experience the best message app out there!',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w200, color: Colors.black38),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(
                  onPressed: () async {
                    if (ap.isSignedIn == true) {
                      await ap.getDataFromSp().whenComplete(
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactsScreen(),
                              ),
                            ),
                          );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                  },
                  text: 'Press to continue',
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
