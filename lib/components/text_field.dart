import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.inputType,
    required this.maxLines,
   required this.controller,
  });

  final String hintText;
  final IconData icon;
  final TextInputType inputType;
  final int maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.cyan,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.cyan,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.black38, fontWeight: FontWeight.bold),
          alignLabelWithHint: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
