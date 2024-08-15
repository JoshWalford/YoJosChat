import 'package:flutter/material.dart';
import 'package:yojo_chats/screens/countries_areacode.dart';

import '../widgets/buttons/forward_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _selectedCountry = 'Country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 250),
              Text(
                'Your Phone Number',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                'Please confirm your country code and enter your phone number.',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w100, color: Colors.grey.shade500),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                readOnly: true,
                onTap: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CountriesAreaCode()));
        
                  if (result != null) {
                    setState(() {
                      _selectedCountry = result;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 2.0),
                  ),
                  labelText: _selectedCountry,
                  suffixIcon: const Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          BorderSide(color: Colors.grey.shade300, width: 2.0),
                    ),
                    labelText: 'Phone number',
                suffixIcon: const Icon(Icons.phone_android)),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ForwardButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

