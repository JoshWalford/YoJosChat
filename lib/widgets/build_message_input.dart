import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

Widget buildMessageInput() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(Iconsax.add, color: Colors.cyan.shade200),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Iconsax.gallery_add, color: Colors.cyan.shade200),
          onPressed: () {},
        ),
        Expanded(
          child: TextField(
            maxLines: null,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              prefixIcon: IconButton(
                icon: Icon(Iconsax.emoji_happy, color: Colors.cyan.shade200),
                onPressed: () {},
              ),
              suffixIcon: IconButton(
                icon: Icon(Iconsax.voice_cricle, color: Colors.cyan.shade200),
                onPressed: () {},
              ),
            ),
          ),
        ),
        // IconButton(
        //   icon: Icon(Iconsax.send_1, color: Colors.cyan.shade200),
        //   onPressed: () {},
        // ),
      ],
    ),
  );
}
