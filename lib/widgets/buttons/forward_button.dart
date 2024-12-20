import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/sizes.dart';

class ForwardButton extends StatelessWidget {
  final String routeName;

  const ForwardButton({
    required this.routeName, super.key,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const  Size(YoJoSizes.buttonWidth, YoJoSizes.buttonWidth),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: const CircleBorder(
          side: BorderSide.none,
        ),
        backgroundColor: Colors.cyan.shade200,
      ),
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: const Icon(Iconsax.arrow_right_1),
    );
  }
}
