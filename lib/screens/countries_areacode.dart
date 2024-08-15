import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class CountriesAreaCode extends StatelessWidget {
  const CountriesAreaCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CountryListPick(
            appBar: AppBar(
              backgroundColor: Colors.cyan.shade200,
              title: Text('Select Your country here',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold)
              ),
            ),
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: true,
              isDownIcon: true,
              showEnglishName: true,
              labelColor: Colors.cyan.shade200,
              alphabetSelectedBackgroundColor: Colors.cyan,
              alphabetTextColor: Colors.cyan
            ),
            initialSelection: 'JM',
           onChanged: (CountryCode? code) {
              if (code != null) {
                Navigator.pop(context, code.name);
              }
           },
            useUiOverlay: true,
          ),
        ),
      ),
    );
  }
}
