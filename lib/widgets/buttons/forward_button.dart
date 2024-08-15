import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    super.key,
  });

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
        Navigator.pushNamed(context, '/chatScreen');
      },
      child: const Icon(Icons.arrow_forward),
    );
  }
}
